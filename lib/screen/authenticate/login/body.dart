import 'package:baoren_workplace/service/user_service.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:baoren_workplace/model/user.dart';

final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  const Body({state}) : _state = state;
  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Center(child: Image.asset('asset/welcome.png', height: 200.0)),
                SizedBox(height: 10.0),
                _buildTextField(
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Enter your email"
                        : null,
                    hint: 'Email',
                    onChanged: (value) => _state.email = value),
                SizedBox(
                  height: 20.0,
                ),
                _buildTextField(
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Enter your password"
                        : null,
                    hint: 'Password',
                    isObsecure: !_state.showPassword,
                    button: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () =>
                            _state.showPassword = !_state.showPassword),
                    onChanged: (value) => _state.password = value),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Log in',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    onPressed: () => _onLoginPressed(context),
                    //onPressed: () => _onLoginPressed(context),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context,null);
                    },
                    child: Text("Back to Main Screen",
                        style: TextStyle(
                          color: Colors.grey[800],
                          decoration: TextDecoration.underline,
                        ))),
                (_state.showErrorMessage)
                    ? Text("Error Login.")
                    : SizedBox(
                        height: 10.0,
                      ),
              ]),
        ),
      ),
    );
  }

  TextFormField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged, validator}) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        //prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Log in'),
          onPressed: () => print('haha'),
          //onPressed: () => _onLoginPressed(context),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => print('haha'),
          //onPressed: () => _onCancelPressed(context),
        ),
      ],
    );
  }

  void _onLoginPressed(context) async {
    //Perform Authentication Pressed
    if (_formKey.currentState.validate()) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('${_state.email} | ${_state.password}')));

      final User _user = await UserService.getUserByLoginAndPassword(
          email: _state.email, password: _state.password);
      if (_user == null) {
        _state.showErrorMessage = true;
      } else {
        Navigator.pop(context, _user);
      }
    }
  }
}
