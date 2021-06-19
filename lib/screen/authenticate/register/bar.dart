import 'package:baoren_workplace/screen/authenticate/register/register_screen.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget{
  //const Bar({ Key? key }) : super(key:// key);
   @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          SizedBox(height:5.0),
          Text("Register",),
        ],
      ),
      backgroundColor: Color.fromRGBO(192, 204, 218, 100),
    );
  }
}