import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/services/auth/auth_service.dart';
import 'package:map_project/services/rest.dart';

class AuthServiceRest implements AuthService{
  RestService get rest => dependency();

  Future<Users?> registration({required Users user}) async {
    try {
      final json = await rest.post('user', data: user);
      final _result = Users.fromJson(json);
      return _result;
    } catch (e) {
      return null;
    }
  }

  Future<Users?> login({required String username, required String password}) async {
    try {
      var json = await rest.get('user/$username/$password');
      final _result = Users.fromJson(json);
      return _result;
    } catch(e) {
      return null;
    }
  }

  Future<String?> getUserById({id}) async {
    try {
      var json = await rest.get('user/$id');
      final _result = Users.fromJson(json);
      return _result.name;
    } catch (e) {
      return null;
    }
  }
}