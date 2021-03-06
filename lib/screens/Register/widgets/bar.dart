import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => Size.fromHeight(50.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Register New Account'),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context, null);
        },
      ),
    );
  }
}