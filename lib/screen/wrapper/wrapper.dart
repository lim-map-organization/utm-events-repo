import 'package:baoren_workplace/model/user.dart';
import 'package:baoren_workplace/screen/authenticate/empty/empty_screen.dart';
import 'package:baoren_workplace/screen/home/home_page.dart';
import 'package:baoren_workplace/service/user_service.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  //const Wrapper({ Key? key }) : super(key: key);
  static Route route() => MaterialPageRoute(builder: (context) => Wrapper());

  @override
  WrapperState createState() => WrapperState();
}

class WrapperState extends State<Wrapper> {
  User _user;
  get user => _user;
  set user(value) {
    setState(() {
      _user = value;
    });
    //refreshTodoListFuture();
  }

  void addUser(User user) async {
    final User newUser = await UserService.addUser(user);
    _user = newUser;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   user = User(id: 1, username: "baoren", email: "xdman1221@gmail.com",identity: "student",organization: "School of Computing");
  // }

  @override
  Widget build(BuildContext context) {
    return (_user == null) ? EmptyScreen(state: this) : HomePage(state: this);
  }
}
