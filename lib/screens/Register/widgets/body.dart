import 'package:flutter/material.dart';
import 'package:map_project/screens/Register/register_viewmodel.dart';
import 'package:map_project/screens/Register/widgets/head.dart';
import 'package:map_project/screens/view.dart';

class Body extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: RegisterViewmodel(),
      progressBuilder: (context, viewmodel) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: CircularProgressIndicator()),
      ),
      builder: (context, viewmodel, progressBuilder) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                child: Head(
                  title: "Join Us Now",
                  desc: "Enter your basic information",
                  image: "boy.png",
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextFormField(
                        suffixicon: null,
                        label: 'Username',
                        hint: 'Enter your username.',
                        icon: Icon(Icons.account_box),
                        isObscure: false,
                        validator: (val) {
                          return val.length >= 6
                              ? null
                              : 'Username must contains at least 6 characters long.';
                        },
                        onChanged: (val) {
                          if (val != null) {
                            viewmodel.username = val;
                          } else {}
                        }),
                    _buildTextFormField(
                        suffixicon: IconButton(
                          icon: viewmodel.showPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          color: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            viewmodel.showPassword = !viewmodel.showPassword;
                          },
                        ),
                        label: 'Password',
                        hint: 'Enter your password.',
                        icon: Icon(Icons.lock),
                        isObscure: !viewmodel.showPassword,
                        validator: (val) {
                          return val.length >= 8
                              ? null
                              : 'Password must contains at least 8 characters long.';
                        },
                        onChanged: (val) {
                          viewmodel.password = val;
                        }),
                    _buildTextFormField(
                        suffixicon: null,
                        label: 'Password Confirmation',
                        hint: 'Enter your password again.',
                        icon: Icon(Icons.lock),
                        isObscure: !viewmodel.showPassword,
                        validator: (val) {
                          return viewmodel.cpassword == viewmodel.password
                              ? null
                              : 'Password does not match.';
                        },
                        onChanged: (val) {
                          viewmodel.cpassword = val;
                        }),
                    _buildTextFormField(
                        suffixicon: null,
                        label: 'Your Full Name',
                        hint: 'Enter your fullname.',
                        icon: Icon(Icons.people),
                        isObscure: false,
                        validator: (val) {
                          return val.length > 0
                              ? null
                              : 'Name field must be filled.';
                        },
                        onChanged: (val) {
                          viewmodel.fullname = val;
                        }),
                    _buildTextFormField(
                        suffixicon: null,
                        label: 'Phone Number',
                        hint: 'Enter your phone number.',
                        icon: Icon(Icons.phone),
                        isObscure: false,
                        validator: (val) {
                          return val.length >= 10
                              ? null
                              : 'Phone must be at least 10 characters long.';
                        },
                        onChanged: (val) {
                          viewmodel.phone = val;
                        }),
                    _buildDropDown(
                        label: 'Role',
                        hint: 'Pick your role.',
                        icon: Icon(Icons.person),
                        items: [
                          DropdownMenuItem(
                            child: Text('Student'),
                            value: 'student',
                          ),
                          DropdownMenuItem(
                            child: Text('Staff'),
                            value: 'staff',
                          ),
                        ],
                        validator: (val) {
                          return val != null ? null : 'Role must be selected.';
                        },
                        onChanged: (val) {
                          viewmodel.role = val;
                        }),
                    _buildDropDown(
                        label: 'Faculty/School',
                        hint: 'Pick your faculty/school.',
                        icon: Icon(Icons.school),
                        items: [
                          DropdownMenuItem(
                            //child: Text('School of Computing'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Computing",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value: 'School of Computing',
                          ),
                          DropdownMenuItem(
                            //child: Text('School of Civil Engineering'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Civil Engineering",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value: 'School of Civil Engineering',
                          ),
                          DropdownMenuItem(
                            //child: Text('School of Electrical Engineering'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Electrical Engineering",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value: 'School of Electrical Engineering',
                          ),
                          DropdownMenuItem(
                            //child: Text('School of Mechanical Engineering'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Mechanical Engineering",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value: 'School of Mechanical Engineering',
                          ),
                          DropdownMenuItem(
                            //child: Text('School of Chemical and Energy Engineering'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Chemical and Energy Engineering",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value: 'School of Chemical and Energy Engineering',
                          ),
                          DropdownMenuItem(
                            //child:
                            //    Text('School of Biosciences & Medical Engineering'),
                            child: new Container(
                              width: 170.0,
                              child: new Text(
                                "School of Biosciences & Medical Engineering",
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            value:
                                'School of Biosciences & Medical Engineering',
                          ),
                        ],
                        validator: (val) {
                          return val != null
                              ? null
                              : 'Faculty must be selected.';
                        },
                        onChanged: (val) {
                          viewmodel.faculty = val;
                        }),
                    viewmodel.showErrorMsg
                        ? Text(
                            'Failed to register!',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        : Text(''),
                    SizedBox(height: 10.0),
                    Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                            ),
                            child: Text('Register',
                                style: TextStyle(fontSize: 20.0)),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final _result = await viewmodel.registration();
                                if (_result != null) {
                                  Navigator.pop(context, _result);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
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

  Padding _buildDropDown({label, hint, icon, items, onChanged, validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonFormField(
        decoration:
            InputDecoration(labelText: label, hintText: hint, icon: icon),
        items: items,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
