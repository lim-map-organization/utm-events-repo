import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/authenticate/empty/empty_screen.dart';
import 'package:flutter/material.dart';
import 'empty_screen.dart';
import 'row_button.dart';
class Body extends StatelessWidget {
  Body({state}) : _state = state;
  final EmptyScreen _state;

  void setUser(value){
    _state.setUser(value);
  }
  void addUser(User user) async {
    _state.addUser(user);
  }
  //const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Center(child: Image.asset('asset/error404.png', height: 200.0)),
            Text("User NOT FOUND...", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
            SizedBox(height: 20.0),
            RowButton(state: this),
           ],
      ),
    );
  }
}