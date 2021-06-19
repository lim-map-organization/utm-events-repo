import 'body.dart';
import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
   const RowButton({state}) : _state = state;
   final Body _state;
  //const RowButton({ Key? key }) : supe//r(key: key);
  //   void _onPlusPressed(BuildContext context) async{
  //   final _todo = await Navigator.pushNamed(context, '/new');
  //   if(_todo != null){
  //     _state.addTodo(_todo);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildExpandedButton(
          buttonName: "LOG IN",
          //color: Colors.grey[850],
          onPressed: () async{
            final _user = await Navigator.pushNamed(context, '/login');
            //if the logged in success
            if (_user != null) {
              _state.setUser(_user);
            }
          },
        ),
        SizedBox(width: 10.0),
        _buildExpandedButton(
            buttonName: "REGISTER",
            color: Colors.grey[800],
            onPressed: () => _onRegisterPressed(context)
            )
      ],
    );
  }

  Expanded _buildExpandedButton(
      {buttonName, onPressed, color = Colors.blueGrey}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        child: Text(
          '$buttonName',
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: onPressed,
        //onPressed: () => _onCancelPressed(context),
      ),
    );
  }
  void _onRegisterPressed(BuildContext context) async{
    final _user = await Navigator.pushNamed(context, '/register');
    if(_user != null){
      _state.addUser(_user);
    }
  }
  
}
