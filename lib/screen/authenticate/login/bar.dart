import 'package:flutter/material.dart';
import 'login_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  const Bar({state}) : _state = state;
  final LoginScreenState _state;
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      title: Column(
        children: [
          SizedBox(height:5.0),
          Text("Login Page",),
        ],
      ),
      backgroundColor: Color.fromRGBO(192, 204, 218, 100),
    );
  }
}