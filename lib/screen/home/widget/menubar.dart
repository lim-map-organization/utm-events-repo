import 'package:flutter/material.dart';
import '../body.dart';

class MenuBar extends StatelessWidget {
  MenuBar({state}) : _state = state;
  final Body _state;
  final menu = {
    "staff": {
      "task": ["View\nEvent", "View\nMeet"],
      "icon": ["celebrate.png", "meet.png"],
      "screen": ["/event-list","/app-list"]
    },
    "student": {
      "task": ["Add\nEvent", "Add\nMeet", "View\nEvent", "View\nMeet"],
      "icon": ["calendar.png", "memo.png", "bookmarks.png", "notes.png"],
      "screen": ["/event-form","/app-form","/event-list","/app-list"]
    }
  };
  //const MenuBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menubar = menu[_state.getUser().identity];
    //print(menubar["icon"]);
    return SizedBox(
        height: 105.0,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
                  width: (_state.getUser().identity == "student")? 105.0 : 210.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[50],
                    ),
                    onPressed: () async{
                      Navigator.pushNamed(context, '${menubar["screen"][index]}',arguments: _state.getUser());
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          Image.asset(
                            'asset/${menubar["icon"][index]}',
                            width: 40.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(menubar["task"][index],
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
            itemCount: menubar["task"].length));
  }
}
