import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/auth/auth_service.dart';

class RegisterViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Users _user = Users();
  bool _showPassword = false;
  bool _showErrorMsg = false;
  String _cpassword = '';

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMsg => _showErrorMsg;
  set showErrorMsg(value) {
    turnBusy();
    _showErrorMsg = value;
    turnIdle();
  }

  get user => _user;
  set user(value) => _user = value;

  get fullname => _user.name;
  set fullname(value) {
    turnBusy();
    _user.name = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _user.password = value;
    turnIdle();
  }

  get cpassword => _cpassword;
  set cpassword(value) {
    turnBusy();
    _cpassword = value;
    turnIdle();
  }

  get phone => _user.phone;
  set phone(value) {
    turnBusy();
    _user.phone = value;
    turnIdle();
  }

  get username => _user.username;
  set username(value) {
    turnBusy();
    _user.username = value;
    turnIdle();
  }

  get faculty => _user.faculty;
  set faculty(value) {
    turnBusy();
    _user.faculty = value;
    turnIdle();
  }

  get role => _user.role;
  set role(value) {
    turnBusy();
    _user.role = value;
    turnIdle();
  }

  Future<Users?> registration() async {
    turnBusy();
    final Users? _result = await _service.registration(user: _user);
    if (_result == null) {_showErrorMsg = true;}
    else {_showErrorMsg = false; _user = _result;}
    turnIdle();
    return _result;
  }
}