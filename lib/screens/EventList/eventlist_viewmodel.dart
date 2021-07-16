import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/event/event_service.dart';

class EventListViewmodel extends Viewmodel {
  EventService get _service => dependency();
  UserViewmodel get _user => dependency();
  List<EventInfo>? _eventList;
  Future<List<EventInfo>?>? _eventListFuture;

  EventListViewmodel() {
    if (_user.role == 'student') {
      _eventListFuture = getEventListById(_user.id);
    } else {
      _eventListFuture = getEventList();
    }
  }
  get eventList => _eventList;
  set eventList(value) {
    _eventList = value;
  }
  get length => _eventList!.length;

  get eventListFuture => _eventListFuture;
  set eventListFuture(value) {
    turnBusy();
    _eventListFuture = value;
    turnIdle();
  }

  get user => _user;

  Future<List<EventInfo>?>? getEventListById(id) async {
    turnBusy();
    final _result = await _service.getEventListById(id: id);
    turnIdle();
    return _result;
  }

  Future<List<EventInfo>?>? getEventList() async {
    turnBusy();
    final _result = await _service.getEventList();
    turnIdle();
    return _result;
  }
}
