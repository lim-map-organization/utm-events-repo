import 'rest.dart';
import 'package:baoren_workplace/model/user.dart';

class UserService {
  static Future<User> getUserByLoginAndPassword(
      {String email, String password}) async {
        final listJson = await Rest.get('event-user?email=${email}&password=${password}');
        if (listJson.length == 0) return null;
        //return User(id: 1);
        return User.fromJson(listJson[0]);
      }
   static Future<User> addUser(User user) async {
    //Add the item except the id 
    final json = await Rest.post('event-user', data: user); 
    return User.fromJson(json);
  }
  static Future<List<User>> getStaffsList() async {
    final List listJson = await Rest.get('event-user?identity=staff');
    //Convert response to object
    return listJson.map((json) => User.fromJson(json)).toList();
  }
}
