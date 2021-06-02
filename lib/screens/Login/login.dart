import 'package:flutter/material.dart';
import 'package:mapproject/screens/Login/widgets/bar.dart';
import 'package:mapproject/screens/Login/widgets/body.dart';
import 'package:mapproject/app/route.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void navigate() async {
    final returnData = await Navigator.pushNamed(
      context, registerScreen
    );
    if (returnData != null) {

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Body(navigate: navigate),
    );
  }
}