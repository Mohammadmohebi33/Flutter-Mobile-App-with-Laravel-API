
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          color: Theme.of(context).primaryColorDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 8,
                margin: EdgeInsets.only(left: 16 , right: 16),
               color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children:   <Widget>[
                     const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'login',
                        ),
                      ),
                      const  TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'password',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                          print("hello login");
                        }),
                         child: Text('login') , style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 36)),
                         ),

                     Padding(
                       padding: EdgeInsets.only(top: 16),
                       child:  InkWell(
                          onTap: (() {
                             Navigator.pushNamed(context, '/Register');
                          }),
                          child: Text('Register new user'),
                        ),
                     ),   
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}