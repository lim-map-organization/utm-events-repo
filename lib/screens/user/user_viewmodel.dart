import 'package:map_project/models/users.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  Users _user = Users();

  get user => _user;
  set user(value) {
    turnBusy();
    _user = value;
    turnIdle();
  }
  
  get role {
    print(_user.role);
    return _user.role;
  }

  get id => _user.id;

  bool get isUserSignedIn => _user.role == '';
}
