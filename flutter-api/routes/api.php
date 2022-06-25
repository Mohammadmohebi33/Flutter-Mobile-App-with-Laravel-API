<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'auth:sanctum'] ,  function (){

    Route::apiResource('categories', \App\Http\Controllers\Api\CategoryController::class);
    Route::apiResource('transactions', \App\Http\Controllers\Api\TransactionController::class);
    Route::post('/logout' , [\App\Http\Controllers\Api\AuthController::class , 'logout']);
});

Route::post('/register' , [\App\Http\Controllers\Api\AuthController::class , 'Register']);
Route::post('/login' , [\App\Http\Controllers\Api\AuthController::class , 'login']);
Route::apiResource('categories', \App\Http\Controllers\Api\CategoryController::class);


