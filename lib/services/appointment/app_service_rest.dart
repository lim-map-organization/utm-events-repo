import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/appinfo.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/services/appointment/app_service.dart';
import 'package:map_project/services/rest.dart';

class AppServiceRest implements AppService{
  RestService get rest => dependency();

  Future<List<AppInfo>?>? getAppList({required String id}) async {
    try {
      final json = await rest.get('app/$id');
      print("success");
      return (json as List).map((item) { return AppInfo.fromJson(item);}).toList();
    } catch (e) {
      print("error");
      return null;
    }
  }

  Future<AppInfo?> createApp({required AppInfo appInfo}) async {
    try {
      final json = await rest.post('app', data: appInfo);
      return AppInfo.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<List<Users>?>? getUsersByFac({required String faculty}) async {
    try {
      final json = await rest.get('user/faculty/$faculty');
      return (json as List).map((item) => Users.fromJson(item)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<AppInfo?> updateStatus({required String id, required AppInfo appinfo}) async {
    try {
      final json = await rest.put('app/$id', data: appinfo);
      return AppInfo.fromJson(json);
    } catch (e) {
      return null;
    }
  }
}