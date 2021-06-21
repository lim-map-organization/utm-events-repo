import 'package:map_project/models/appinfo.dart';
import 'package:map_project/models/users.dart';

abstract class AppService {
  Future<List<AppInfo>?>? getAppList({required String id});

  Future<AppInfo?> createApp({required AppInfo appInfo});

  Future<List<Users>?>? getUsersByFac({required String faculty});

  Future<AppInfo?> updateStatus({required String id, required AppInfo appinfo});
}