import 'package:baoren_workplace/model/event.dart';
import 'package:baoren_workplace/screen/event/list/list_event.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  //const Body({ Key? key }) : super(key: key);
  Body({state}) : _state = state;
  final EventListState _state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
        future: _state.eventListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _state.eventList = snapshot.data;
            return buildListView();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView buildListView() {
    return ListView.separated(
      itemCount: _state.eventList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => InkWell(
        onLongPress: () => (_state.eventList[index].status == "reject")
            ? OnLongPressed(index)
            : null,
        onTap: () => OnTapItem(index, context, _state.eventList[index]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_state.eventList[index].event}',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                          '${_state.eventList[index].date} | ${_state.eventList[index].timeslot}')
                    ])),
            Expanded(
                child: Center(
              child: Text(
                _state.eventList[index].status,
                style: TextStyle(fontFamily: "Now", fontSize: 32.0),
              ),
            )),
          ]),
        ),
      ),
    );
  }

  void OnTapItem(index, context, event) async {
    bool staffStyle = (_state.eventList[index].status.toLowerCase() == "pending" &&
        _state.widget.user.identity == "staff");
    bool studStyle = (_state.eventList[index].status.toLowerCase() == "approve" &&
        _state.widget.user.identity == "student");
    if (staffStyle || studStyle) {
      final _event = await Navigator.pushNamed(context, '/event-edit',
          arguments: [_state.widget.user, event]);
      // if(_app != null){
      //   _state.addTodo(_app);
      // }
      // print("OnTap: ${index}");
      // _state.updateTodo(index: index,todo: _app);
      if (_event != null) {
        _state.updateEvent(index: index, event: _event);
      }
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Waiting For Approval")));
    }
  }

  void OnLongPressed(index) {
    _state.removeEvent(index);
  }
}
