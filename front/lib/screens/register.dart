import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
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
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                     const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const  TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'password',
                        ),
                      ),
                       const TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (() {
                           Navigator.pushNamed(context, '/Categories');
                        }),
                         child: Text('Register') , style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 36)),
                         ),
                       Padding(
                       padding: EdgeInsets.only(top: 16),
                       child:  InkWell(
                          onTap: (() {
                             Navigator.pop(context);
                          }),
                          child: Text('Back to login'),
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