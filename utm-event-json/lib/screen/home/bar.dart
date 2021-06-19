import 'package:flutter/material.dart';
import 'home_page.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  Bar({state}) : _state = state;
  final HomePage _state;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){print("Hamburger!");},icon: const Icon(Icons.menu_rounded),),
      title: Column(
        children: [
          SizedBox(height:5.0),
          Text("Home",),
        ],
      ),
      actions: [
        IconButton(onPressed: ()=> _state.logOut(),icon: const Icon(Icons.logout),)
      ],
      backgroundColor: Color.fromRGBO(192, 204, 218, 100),
    );
  }
}