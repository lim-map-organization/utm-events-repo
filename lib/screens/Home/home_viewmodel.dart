import 'package:map_project/app/dependencies.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';

class HomeViewmodel extends Viewmodel{
  UserViewmodel get _user => dependency();

  get user => _user.user;
  set user(value) => _user.user = value;
}