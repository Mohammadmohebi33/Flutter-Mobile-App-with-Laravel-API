import 'package:flutter/material.dart';
import 'package:front/screens/categories.dart';
import 'package:front/screens/login.dart';
import 'package:front/screens/register.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Login(),

     routes: {
      '/Login' :(context) => Login() ,
      '/Register':(context) => Register(),
      '/Categories' :(context) => Categories()
     },
    );
  }
}