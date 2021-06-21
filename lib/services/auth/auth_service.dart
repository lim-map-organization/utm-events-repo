import 'package:map_project/models/users.dart';

abstract class AuthService {
  Future<Users?> registration({required Users user}); 

  Future<Users?> login({required String username, required String password});

  Future<String?> getUserById({id});
}