import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/users.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/services/auth/auth_service.dart';
import '../viewmodel.dart';

class LoginViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  UserViewmodel get _user => dependency();
  String _username = '';
  String _password = '';
  bool _showPassword = false;
  bool _showErrorMsg = false;

  get user => _user.user;
  set user(value) => _user.user = value;

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

  get username => _username;
  set username(value) => _username = value;

  get password => _password;
  set password(value) => _password = value;

  Future<Users?> login() async {
    turnBusy();
    Users? _result =
        await _service.login(username: _username, password: _password);
    if (_result == null) {
      _showErrorMsg = true;
    } else {
      _showErrorMsg = false;
      _user.user = _result;
    }
    turnIdle();
    return _result;
  }
}
