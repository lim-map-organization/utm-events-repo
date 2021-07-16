import 'package:flutter/material.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/screens/Login/login_viewmodel.dart';
import 'package:map_project/screens/Login/widgets/bar.dart';
import 'package:map_project/screens/Login/widgets/body.dart';
import 'package:map_project/screens/view.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
            appBar: Bar(),
            body: Body(),
          ),
        ),
    );
  }
}