import 'package:baoren_workplace/model/event.dart';
import 'package:baoren_workplace/screen/event/form/form_event.dart';
import 'package:baoren_workplace/screen/event/widget/head.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  Body({state}) : _state = state;
  final EventFormState _state;

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

   List<String> timeslot = [
    "Whole Day",
    "Morning Session (8-10)",
    "Brunch Session (10-12)",
    "Afternoon Session (2-4)",
    "Evening Session (4-6)",
    "Night Session (8-10)"
  ];

  @override
  Widget build(BuildContext context) {
    //print(_state.staffListName);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Head(
            title: "Book Event Here",
            desc: "Approve / Reject the event",
            image: "event.png",
          ),
          SizedBox(height: 20.0),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextLisTile(
                  label: "Event Name",
                  value: _state.eventTitle,
                  validator: (val) => (val.isEmpty)
                      ? "Please enter a valid appointment title."
                      : null,
                  onChanged: (val) => _state.eventTitle = val,
                ),
                SizedBox(height: 15.0),
                _buildTextLisTile(
                        label: "Date (dd-mm-yyyy)",
                        value: _state.eventDate,
                        validator: (val) =>
                            !RegExp((r'(\d\d-?\d\d-?\d{4})')).hasMatch(val)
                                ? "Date Format (dd-mm-yyyy)."
                                : null,
                        onChanged: (val) => _state.eventDate = val,
                      ),
               
                SizedBox(height: 15.0),
                _buildTextLisTile(
                  label: "Venue",
                  value: _state.eventVenue,
                  validator: (val) =>
                      (val.isEmpty) ? "Please enter a venue." : null,
                  onChanged: (val) => _state.eventVenue = val,
                ), SizedBox(height: 15.0),
                Text("Time Slot",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                _buildDropdownButton(
                  theValue: _state.eventTimeslot,
                  onChange: (val) => _state.eventTimeslot = val,
                  list: timeslot,
                ),
                 SizedBox(height: 15.0),
                Text("Organization",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                _buildDropdownButton(
                  theValue: _state.eventOrg,
                  onChange: (val) => _state.eventOrg = val,
                  list: organization,
                ),
                SizedBox(height: 15.0),
                _buildTextLisTile(
                  label: "Official Letter Referral Code",
                  value: _state.eventLetter,
                  validator: (val) =>
                      (val.isEmpty) ? "Please enter a valid letter code." : null,
                  onChanged: (val) => _state.eventLetter = val,
                ),
                SizedBox(height: 15.0),
                _buildTextLisTile(
                  label: "Contact Number",
                  value: _state.eventPhone,
                  validator: (val) =>
                      (val.isEmpty) ? "Please enter a valid phone number." : null,
                  onChanged: (val) => _state.eventPhone = val,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildExpandedButton(
                      buttonName: "Add",
                      onPressed: () => _onAddEvent(context),
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

    void _onAddEvent(context) async {
    int staffID = 0;
    // for(var user in _state.staffList){
    //   if(user.username == _state.appStaff){
    //     staffID = user.id;
    //   }
    // }
    //print(_state.organization);
    //Perform Authentication Pressed
    if (_formKey.currentState.validate()) {
      Event _event = new Event(
        event: _state.eventTitle,
        date: _state.eventDate,
        timeslot: _state.eventTimeslot,
        letter: _state.eventLetter,
        status: "pending",
        organization: _state.eventOrg,
        contactNo: _state.eventPhone
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Add Appointment Successfully!")));

      if (_event == null) {
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Appointment is not found.")));
      } else {
        Navigator.pop(context, _event);
      }
    }
  }
}
