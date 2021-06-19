import 'package:baoren_workplace/model/news.dart';
import 'package:baoren_workplace/model/user.dart';
import 'widget/news_list.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'widget/menubar.dart';
import 'widget/head_part.dart';

class Body extends StatelessWidget {
  Body({state}) : _state = state;
  final HomePage _state;

  User getUser(){
    return _state.getUser();
  }

  Future<List<News>> getFutureNews(){
    return _state.newsListFuture;
  }

  void logOut(){
    _state.logOut();
  }

  //const Body({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //User myuser = _state.getUser();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: HeadPart(state: this),
        ),
        MenuBar(state: this),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Text("Latest News",style: TextStyle(color: Colors.blueGrey[900], fontFamily: 'Now', fontSize: 20.0),),
              SizedBox(height: 5.0),
              NewList(state: this),
            ],
          ),
        ),
      ],
    );
  }
}
