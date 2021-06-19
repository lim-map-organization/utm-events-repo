import 'package:baoren_workplace/model/user.dart';
import 'package:flutter/material.dart';
import '../body.dart';

class HeadPart extends StatelessWidget {
  const HeadPart({state}) : _state = state;
  final Body _state;
  //const HeadPart({ Key? key }) : super(key: key);

  String convertToTitleCase(String text) {
    if (text == null) {
      return null;
    }

    if (text.length <= 1) {
      return text.toUpperCase();
    }
    if(text.length >=10){
      text = text.trim().substring(0,9);
      text += "...";
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
    User myuser = _state.getUser();
    String fullName = convertToTitleCase(myuser.username); 
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, ${fullName}",
                  style: TextStyle(fontFamily: 'Now', fontSize: 40.0),
                ),
                SizedBox(height: 5.0),
                Text("${convertToTitleCase(myuser.identity)} | ${myuser.organization}"),
              ],
            )),
        SizedBox(width: 0.0),
        Flexible(flex: 2, child: Image.asset('asset/boy.png')),
      ],
    );
  }
}
