import 'package:baoren_workplace/model/appointment.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/appointment/form/form_appointment.dart';
import 'package:baoren_workplace/screen/appointment/widget/head.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  Body({state}) : _state = state;
  final AppFormState _state;

  String convertToTitleCase(String text) {
    if (text == null) {
      return null;
    }

    if (text.length <= 1) {
      return text.toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = text.split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);
        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }

  List<String> organization = [
    "Faculty of Engineering",
    "School Of Computing",
    "School of Chemical",
    "School of Mechanical.Eng",
    "School of Electrical.Eng",
  ];

  @override
  Widget build(BuildContext context) {
    print(_state.staffListName);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Head(
            title: "Book Appointment",
            desc: "we arrange for you",
            image: "calender2.png",
          ),
          SizedBox(height: 20.0),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLisTile(
                  label: "Appointment Title",
                  value: _state.appTitle,
                  validator: (val) => (val.isEmpty)
                      ? "Please enter a valid appointment title."
                      : null,
                  onChanged: (val) => _state.appTitle = val,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: _buildTextLisTile(
                        label: "Date (dd-mm-yyyy)",
                        value: _state.appDate,
                        validator: (val) =>
                            !RegExp((r'(\d\d-?\d\d-?\d{4})')).hasMatch(val)
                                ? "Date Format (dd-mm-yyyy)."
                                : null,
                        onChanged: (val) => _state.appDate = val,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: _buildTextLisTile(
                        label: "Time (hh:mm am/pm)",
                        value: _state.appTime,
                        validator: (val) =>
                            !RegExp((r'([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])\s*([AaPp][Mm])'))
                                    .hasMatch(val)
                                ? "hh:mm am/pm format."
                                : null,
                        onChanged: (val) {
                          print(RegExp(
                                  (r'([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])\s*([AaPp][Mm])'))
                              .hasMatch(val));
                          _state.appTime = val;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text("Organization",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                _buildDropdownButton(
                  theValue: _state.appOrg,
                  onChange: (val) => _state.appOrg = val,
                  list: organization,
                ),
                SizedBox(height: 15.0),
                Text("People in Charge",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                _buildDropdownButton(
                  theValue: _state.appStaff,
                  onChange: (val) => print(val),
                  list: _state.staffListName,
                ),
                SizedBox(height: 15.0),
                _buildTextLisTile(
                  label: "Describe why you meet the staff.",
                  value: _state.appReason,
                  validator: (val) =>
                      (val.isEmpty) ? "Please enter a reason." : null,
                  onChanged: (val) => _state.appReason = val,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildExpandedButton(
                      buttonName: "Add",
                      onPressed: () => _onAddApp(context),
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
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextLisTile(
      {label, value, onChanged, validator, isObscure = false, button = null}) {
    return TextFormField(
      decoration: InputDecoration(hintText: label, suffixIcon: button),
      initialValue: value,
      obscureText: isObscure,
      validator: validator,
      onChanged: onChanged,
    );
  }

  DropdownButton _buildDropdownButton({theValue, onChange, list}) {
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
          child: Text(convertToTitleCase(value)),
        );
      }).toList(),
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

    void _onAddApp(context) async {
    int staffID = 0;
    for(var user in _state.staffList){
      if(user.username == _state.appStaff){
        staffID = user.id;
      }
    }
    //print(_state.organization);
    //Perform Authentication Pressed
    if (_formKey.currentState.validate()) {
      Appointment _app = new Appointment(
        title: _state.appTitle,
        date: _state.appDate,
        time: _state.appTime,
        staff:staffID ,
        reason: _state.appReason,
        status: "pending",
        organization: _state.appOrg
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Add Appointment Successfully!")));

      if (_app == null) {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Appointment is not found.")));
      } else {
        Navigator.pop(context, _app);
      }
    }
  }
}
