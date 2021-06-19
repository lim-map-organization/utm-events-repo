import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  Bar({title}) : _title = title;
  String _title;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          SizedBox(height:5.0),
          Text("${_title}",),
        ],
      ),
      backgroundColor: Color.fromRGBO(192, 204, 218, 100),
    );
  }
}