<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Nette\Schema\ValidationException;

class AuthController extends Controller
{



    public function Register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|string|max:255|unique:users',
            'password' => ['required' , 'confirmed'],
            'device_name' => 'required'
        ]);

        $user = User::query()->create([
            'name' => $request->name ,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return $user->createToken($request->device_name)->plainTextToken;
    }





    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required'
        ]);

        $user = User::query()->where('email' , $request->email)->first();
        if (!$user || Hash::check($user->password , $request->password)){
            throw \Illuminate\Validation\ValidationException::withMessages([
                'email' => ['email or password is incorrect'],
            ]);
        }
        return $user->createToken($request->device_name)->plainTextToken;
    }





    public function logout(Request $request)
    {
       $user = User::query()->where('email' , $request->email)->first();
       if ($user){
           $user->tokens()->delete();
       }
       return response()->noContent();
    }
}
