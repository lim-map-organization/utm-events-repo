import 'package:baoren_workplace/model/news.dart';
import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/wrapper/wrapper.dart';
import 'package:baoren_workplace/service/new_service.dart';
import 'package:flutter/material.dart';
import 'bar.dart';
import 'body.dart';
import 'sidebar.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);
  HomePage({state}) : _state = state;
  final WrapperState _state;

  List<News> _newsList;
  get newsList => _newsList;
  set newsList(value) =>  _newsList = value;

  Future<List<News>> _newsListFuture;
  get newsListFuture => _newsListFuture;
  set newsListFuture(value) => _newsListFuture = value;


  User getUser(){
    _newsListFuture = NewsService.getNewsList();
    return _state.user;
  }

  void logOut(){
    _state.user = null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(state: this),
          drawer: SideBar(state: this),
          body: Body(state: this,),
        ),
      ),
    );
  }
}