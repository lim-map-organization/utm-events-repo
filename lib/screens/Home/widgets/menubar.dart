import 'package:flutter/material.dart';
import 'package:map_project/app/route.dart';
import 'package:map_project/models/users.dart';
import 'body.dart';

class MenuBar extends StatelessWidget {
  MenuBar({state,user}) : _state = state, _user = user;
  final Body _state;
  final Users _user;
  final menu = {
    "staff": {
      "task": ["View\nEvent", "View\nMeet"],
      "icon": ["celebrate.png", "meet.png"],
      "screen": [eventList,appList]
    },
    "student": {
      "task": ["Add\nEvent", "Add\nMeet", "View\nEvent", "View\nMeet"],
      "icon": ["calendar.png", "memo.png", "bookmarks.png", "notes.png"],
      "screen": [eventForm,appForm, eventList,appList]
    }
  };
  //const MenuBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menubar = menu[_user.role];
    //print(menubar["icon"]);
    return SizedBox(
        height: 105.0,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
                  width: (_user.role == "student")? 105.0 : 210.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[50],
                    ),
                    onPressed: () async{
                      Navigator.pushNamed(context, '${menubar!["screen"]![index]}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          Image.asset(
                            'asset/${menubar!["icon"]![index]}',
                            width: 40.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(menubar["task"]![index],
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blueGrey[900], fontFamily: 'Now'),),
                        ],
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.blueGrey,
                ),
            itemCount: menubar!["task"]!.length));
  }
}
