import 'package:map_project/models/users.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  Users? _user = null;

  get user => _user;
  set user(value) {
    turnBusy();
    _user = value;
    turnIdle();
  }
  
  get role {
    return _user!.role;
  }

  get id => _user!.id;

  bool get isUserSignedIn => _user == null;
}
