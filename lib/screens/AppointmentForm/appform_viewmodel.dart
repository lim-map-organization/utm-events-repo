import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/appointment/app_service.dart';

class AppFormViewmodel extends Viewmodel {
  AppService get _service => dependency();
  UserViewmodel get _user => dependency();
  AppListViewmodel get _appList => dependency();
  AppInfo appinfo = AppInfo();
  List<Users>? _userListByFac;
  String _pickedDate = DateTime.now().add(const Duration(days: 2)).year.toString() + '/' + DateTime.now().add(const Duration(days: 2)).month.toString() + "/" + DateTime.now().add(const Duration(days: 2)).day.toString()
  + "  " + DateTime.now().add(const Duration(days: 2)).hour.toString().padLeft(2, '0') + ":" + DateTime.now().add(const Duration(days: 2)).minute.toString().padLeft(2, '0');

  get user => _user.id;

  get date => _pickedDate;
  set date(value) {
    turnBusy();
    _pickedDate = value;
    turnIdle();
  }

  get userListByFac => _userListByFac;
  set userListByFac(value) {
    turnBusy();
    _userListByFac = value;
    turnIdle();
  }

  get title => appinfo.name;
  set title(value) => appinfo.name = value;

  get faculty => appinfo.faculty;
  set faculty(value) => appinfo.faculty = value;

  get staffid => appinfo.staffid;
  set staffid(value) => appinfo.staffid = value;

  get detail => appinfo.detail;
  set detail(value) => appinfo.detail = value;

  set status(value) => appinfo.status = value;

  set studentid(value) => appinfo.studentid = value;

  Future<List<Users>?> getUsersByFac(fac) async {
    turnBusy();
    final _result = await _service.getUsersByFac(faculty: fac);
    turnIdle();
    if (_result == null) return null;
    return _result;
  }

  Future<AppInfo?> createApp(appInfo) async {
    turnBusy();
    final _result = await _service.createApp(appInfo: appInfo);
    turnIdle();
    if(_result == null) return null;
    return _result;
  }
}