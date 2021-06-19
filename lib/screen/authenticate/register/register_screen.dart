import 'package:baoren_workplace/screen/authenticate/register/bar.dart';
import 'package:baoren_workplace/screen/authenticate/register/body.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  //const RegisterScreen({ Key? key }) : super(key: key);
   static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  
  String _username = "";
  get username => _username;
  set username(value) => setState(()=> _username = value);

  String _email = "";
  get email => _email;
  set email(value) => setState(()=> _email = value);

  String _phoneNo = "";
  get phoneNo => _phoneNo;
  set phoneNo(value) => setState(()=> _phoneNo = value);

  String _password = "";
  get password => _password;
  set password(value) =>setState(()=> _password = value);

  String _confirmPassword = "";
  get confirmPassword => _confirmPassword;
  set confirmPassword(value) => setState(()=> _confirmPassword = value);

  String _identity = "Student";
  get identity => _identity;
  set identity(value) => setState(()=> _identity = value);

  String _organization = "School Of Computing";
  get organization => _organization;
  set organization(value) => setState(()=> _organization = value);

  bool _showPassword = false;
  get showPassword => _showPassword;
  set showPassword(value) => setState(()=> _showPassword = value);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Body(state: this,),
          ),
        ),
      ),
    );
  }
}