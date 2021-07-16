import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/appointment/app_service.dart';
import 'package:map_project/services/auth/auth_service.dart';

class AppListViewmodel extends Viewmodel {
  AppService get _service => dependency();
  AuthService get _auth => dependency();
  UserViewmodel get _user => dependency();
  List<AppInfo>? _appList;
  Future<List<AppInfo>?>? _appListFuture;

  AppListViewmodel() {
    _appListFuture = getAppList(_user.id);
  }

  get appList => _appList;
  set appList(value) {
    _appList = value;
  }
  get length => _appList!.length;

  get appListFuture => _appListFuture;
  set appListFuture(value) {
    turnBusy();
    _appListFuture = value;
    turnIdle();
  }

  get user => _user;

  Future<List<AppInfo>?>? getAppList(id) async {
    turnBusy();
    List<AppInfo>? _result = await _service.getAppList(id: id);
    if (_result != null) {
      _result.forEach((e) async {
        e.staffname = await getNameById(e.staffid);
        e.studentname = await getNameById(e.studentid);
      });
    }
    turnIdle();
    return _result;
  }

  Future<String?> getNameById(id) async {
    turnBusy();
    String? _result = await _auth.getUserById(id: id);
    turnIdle();
    return _result;
  }
}
