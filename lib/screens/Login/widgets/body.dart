import 'package:flutter/material.dart';
import 'package:mapproject/app/route.dart';

class Body extends StatelessWidget {
  final Function navigate;
  Body({this.navigate});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          // to be changed into Welcome image
          child: Icon(Icons.ac_unit, size: MediaQuery.of(context).size.height / 4,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username.',
              icon: Icon(Icons.account_box)
            ),
            onChanged: (val) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password.',
              icon: Icon(Icons.lock)
            ),
            obscureText: true,
            onChanged: (val) {},
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, studentHome);
                  },
                ),
              ),
            ),
          ]
        ),
        Center(
          child: TextButton(
            child: Text('Forgot password?'),
            onPressed: () {},
          ),
        ),
        Center(
          child: TextButton(
            child: Text("Don't have an account yet? Register now!"),
            onPressed: () {
              navigate();
            },
          ),
        ),
      ],
    );
  }
}