import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/news.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/news/new_service.dart';

class HomeViewmodel extends Viewmodel{
  UserViewmodel get _user => dependency();
  NewsService get _news => dependency();
  List<News>? _newList;
  Future<List<News>>? _newListFuture;

    get user {
      newListFuture = _news.getNews(); 
      return  _user.user;
      }
  set user(value) => _user.user = value;

  HomeViewmodel(){
    getNewsList();
  }

  get newList => _newList;
  set newList(value) => _newList = value;

  get newListFuture => _newListFuture;
  set newListFuture(value) {
    turnBusy();
    _newListFuture = value;
    turnIdle();
  }

  Future<List<News>>? getNewsList() async {
    turnBusy();
    final _result = await _news.getNews();
    turnIdle();
    return _result;
  } 


}