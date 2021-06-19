import 'package:flutter/material.dart';
import 'bar.dart';
import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());
  
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get email => _email;
  set email(value) => setState(()=> _email = value);

  get password => _password;
  set password(value) => setState(()=> _password = value);

  get showPassword => _showPassword;
  set showPassword(value) => setState(()=> _showPassword = value);

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) => setState(()=> _showErrorMessage = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          body: Body(state: this,),
        ),
      ),
    );
  }
}