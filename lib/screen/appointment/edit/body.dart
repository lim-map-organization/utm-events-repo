import 'package:baoren_workplace/screen/appointment/edit/edit_screen.dart';
import 'package:baoren_workplace/screen/event/widget/head.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  Body({state}) : _state = state;
  final EditAppState _state;

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

  @override
  Widget build(BuildContext context) {
    print(_state.widget.user.identity);
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Head(
            title: "Edit Appointment",
            desc: "Think twice before accept",
            image: "calender2.png",
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                "${_state.widget.app.title}",
                style: TextStyle(fontFamily: "Now", fontSize: 25.0),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                        Text(
                          "${_state.widget.app.date}",
                          style: TextStyle(fontSize: 20.0),
                        )
                      ])),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                      Text(
                        "${_state.widget.app.time}",
                        style: TextStyle(fontSize: 20.0),
                      )
                    ]),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Staff",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
            Text(
              "${convertToTitleCase(_state.staffName)}",
              style: TextStyle(fontSize: 20.0),
            )
          ]),
          SizedBox(height: 20.0),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Organization",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
            Text(
              "${_state.widget.app.organization}",
              style: TextStyle(fontSize: 20.0),
            ),
          ]),
              SizedBox(height: 20.0),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Reason",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
            Text(
              "${_state.widget.app.reason}",
              style: TextStyle(fontSize: 20.0),
            ),
          ]),
          SizedBox(height: 40.0),
          (_state.widget.user.identity == "staff") ?
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExpandedButton(
                  buttonName: "Approve",
                  onPressed: () => onClicked(context,"approve"),
                ),
                SizedBox(width: 20.0),
                _buildExpandedButton(
                  buttonName: "Reject",
                  onPressed: () => onClicked(context,"reject"),
                ),
              ],
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExpandedButton(
                  buttonName: "Attend",
                  onPressed: () => onClicked(context,"attend"),
                ),
                SizedBox(width: 20.0),
                _buildExpandedButton(
                  buttonName: "Reject",
                  onPressed: () => onClicked(context,"reject"),
                ),
              ],
            ),
        ]));
  }

  void onClicked(BuildContext context, String status){
    final _app = _state.widget.app;
    _app.status = status;
    if(_app == null){
       ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Appointment is not found.")));
    }
    else{
      Navigator.pop(context,_app);
    }
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

}
