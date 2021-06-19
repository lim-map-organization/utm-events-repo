import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'body.dart';

class EmptyScreen extends StatelessWidget {
  EmptyScreen({state}) : _state = state;
  final WrapperState _state;

  void setUser(value){
    _state.user = value;
  }
  void addUser(User user) async {
    _state.addUser(user);
    _state.user = user;
  }

  @override
  Widget build(BuildContext context) {
   return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(state: this,),
        ),
      ),
    );
  }
}