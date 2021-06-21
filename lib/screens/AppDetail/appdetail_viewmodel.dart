import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/screens/AppList/applist_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/appointment/app_service.dart';
import 'package:map_project/services/auth/auth_service.dart';

class AppDetailViewmodel extends Viewmodel {
  AppService get _service => dependency();
  AppListViewmodel get _applist => dependency();

  Future updateStatus(index, app, status) async {
    AppInfo appinfo = AppInfo.copy(app);
    appinfo.status = status;
    turnBusy();
    final _result = await _service.updateStatus(id: appinfo.id, appinfo: appinfo);
    if(_result != null) _applist.appList[index] = _result;
    turnIdle();
    return _result;
  }
}