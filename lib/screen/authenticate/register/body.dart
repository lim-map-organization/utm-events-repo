import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/authenticate/register/register_screen.dart';
import 'package:baoren_workplace/screen/authenticate/register/widget/head_part.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  Body({state}) : _state = state;
  final RegisterScreenState _state;
  
  List<String> identity = ["Student", "Staff"];
  List<String> organization = [
    "Faculty of Engineering", 
    "School Of Computing",
    "School of Chemical",
    "School of Mechanical.Eng",
    "School of Electrical.Eng",
    ];


  //const Bar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Head(
            title: "Join Us Now",
            desc: "Enter your basic information",
            image: "boy.png",
          ),
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextLisTile(
                      label: "Username",
                      value: _state.username,
                      onChanged: (text) {
                        _state.username = text;
                      },
                      validator: (val) => (val.length < 3 || val.length > 10)
                          ? 'Enter the username (between 3-10)?'
                          : null,
                    ),
                    SizedBox(height: 10.0),
                    _buildTextLisTile(
                      label: "Email",
                      value: _state.email,
                      onChanged: (text) {
                        print(RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(text));
                        _state.email = text;
                      },
                      validator: (val) => !(RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val))
                          ? "Enter the correct email format (Ex. aa@gmail.com)"
                          : null,
                    ),
                    SizedBox(height: 10.0),
                    _buildTextLisTile(
                      label: "Phone",
                      value: _state.phoneNo,
                      onChanged: (text) {
                        _state.phoneNo = text;
                      },
                      validator: (val) => (val.isEmpty)
                          ? "Enter the valid telephone number"
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Identity",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              _buildDropdownButton(
                                theValue:_state.identity ,
                                onChange: (val) => _state.identity = val,
                                list: identity,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          flex: 14,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Organization",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              _buildDropdownButton(
                                theValue:_state.organization,
                                onChange: (val) => _state.organization = val,
                                list: organization,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    _buildTextLisTile(
                      label: "Password",
                      value: _state.password,
                      isObscure: _state.showPassword ,
                      onChanged: (text) {
                        _state.password = text;
                      },
                       button: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () =>
                            _state.showPassword = !_state.showPassword),
                      validator: (val) =>
                          (val.isEmpty) ? "Enter the password" : null,
                    ),
                    SizedBox(height: 10.0),
                    _buildTextLisTile(
                      label: "Confirm Password",
                      value: _state.confirmPassword,
                      isObscure: _state.showPassword ,
                      button: IconButton(
                        icon: Icon(Icons.visibility),
                        onPressed: () =>
                            _state.showPassword = !_state.showPassword),
                      onChanged: (text) {
                        _state.confirmPassword = text;
                      },
                      validator: (val) => (val != _state.password)
                          ? "Password is not same as the current password"
                          : null,
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildExpandedButton(
                          buttonName: "Register",
                          onPressed: () => _onRegister(context),
                        ),
                        SizedBox(width: 20.0),
                        _buildExpandedButton(
                          buttonName: "Cancel",
                          onPressed: () => Navigator.pop(context, null),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  TextFormField _buildTextLisTile(
      {label, value, onChanged, validator, isObscure=false,button=null}) {
    return TextFormField(
      decoration: InputDecoration(hintText: label,suffixIcon: button),
      initialValue: value,
      obscureText: isObscure,
      validator: validator,
      onChanged: onChanged,
    );
  }

  Expanded _buildExpandedButton(
      {buttonName, onPressed, color = Colors.blueGrey}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        child: Text(
          '$buttonName',
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: onPressed,
        //onPressed: () => _onCancelPressed(context),
      ),
    );
  }

  DropdownButton _buildDropdownButton({theValue, onChange,list}){
    return DropdownButton<String>(
      isExpanded: true,
      value: theValue,
      underline: Container(
        height: 2,
        color: Colors.blueGrey,
      ),
      onChanged: onChange,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

  }

  void _onRegister(context) async {
    //print(_state.organization);
    //Perform Authentication Pressed
    if (_formKey.currentState.validate()) {
      String newIdentity = _state.identity.toLowerCase();
      User _user = new User(
          username: _state.username,
          email: _state.email,
          phoneNo: _state.phoneNo,
          identity: newIdentity,
          organization: _state.organization,
          password: _state.password,
          );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Register Successfully!")));

      if (_user == null) {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User not found.")));
      } else {
        Navigator.pop(context, _user);
      }
    }
  }
}
