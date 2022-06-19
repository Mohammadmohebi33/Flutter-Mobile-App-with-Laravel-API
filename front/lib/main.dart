import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('login'),
        ),
        body: Column(
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
               child: Text('login') , style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 36)),)
          ],
        ),
      ),
    );
  }
}