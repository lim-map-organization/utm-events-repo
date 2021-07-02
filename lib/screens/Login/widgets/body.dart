import 'package:flutter/material.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/Login/login_viewmodel.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              // to be changed into Welcome image
              child: Center(
                  child: Image.asset('asset/welcome.png', height: 200.0)),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildTextFormField(
                      label: 'Username',
                      hint: 'Enter your username.',
                      icon: Icon(Icons.account_box),
                      onChanged: (val) {
                        viewmodel.username = val;
                      },
                      isObscure: false,
                      validator: (val) {
                        return val == null ? 'Username must be filled!' : null;
                      }),
                  _buildTextFormField(
                    label: 'Password',
                    hint: 'Enter your password.',
                    icon: Icon(Icons.lock),
                    isObscure: !viewmodel.showPassword,
                    onChanged: (val) {
                      viewmodel.password = val;
                    },
                    validator: (val) {
                      return val == null ? 'Password must be filled!' : null;
                    },
                    suffixicon: IconButton(
                      icon: viewmodel.showPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      color: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        viewmodel.showPassword = !viewmodel.showPassword;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            viewmodel.showErrorMsg
                ? Text(
                    'Invalid username or password!',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                : Text(''),
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic _result = await viewmodel.login();
                        if (_result != null) {
                          Navigator.popAndPushNamed(context, home);
                        }
                      }
                    },
                  ),
                ),
              ),
            ]),
            Center(
              child: TextButton(
                child: Text("Don't have an account yet? Register now!"),
                onPressed: () async {
                  dynamic returnData =
                      await Navigator.pushNamed(context, registerScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(
      {label, hint, onChanged, isObscure, icon, validator, suffixicon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            icon: icon,
            suffixIcon: suffixicon != null ? suffixicon : null),
        obscureText: isObscure,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
