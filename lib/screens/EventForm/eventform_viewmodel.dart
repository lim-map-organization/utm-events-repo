import 'package:map_project/app/dependencies.dart';
import 'package:map_project/models/eventinfo.dart';
import 'package:map_project/screens/user/user_viewmodel.dart';
import 'package:map_project/screens/viewmodel.dart';
import 'package:map_project/services/event/event_service.dart';

class EventFormViewmodel extends Viewmodel{
  EventService get _service => dependency();
  UserViewmodel get _user => dependency();
  EventInfo eventinfo = EventInfo();
  String _pickedDate = DateTime.now().add(const Duration(days: 2)).year.toString() + '/' + DateTime.now().add(const Duration(days: 2)).month.toString() + "/" + DateTime.now().add(const Duration(days: 2)).day.toString();

  get user => _user.id;

  get date => _pickedDate;
  set date(value) {
    turnBusy();
    _pickedDate = value;
    turnIdle();
  }

  get title => eventinfo.name;
  set title(value) => eventinfo.name = value;

  get venue => eventinfo.venue;
  set venue(value) => eventinfo.venue = value;

  get timeslot => eventinfo.timeslot;
  set timeslot(value) => eventinfo.timeslot = value;

  get organization => eventinfo.organization;
  set organization(value) => eventinfo.organization = value;

  get code => eventinfo.code;
  set code(value) => eventinfo.code = value;

  get contact => eventinfo.contact;
  set contact(value) => eventinfo.contact = value;

  set status(value) => eventinfo.status = value;

  set studentid(value) => eventinfo.studentid = value;

  Future<EventInfo?> createEvent(eventInfo) async {
    turnBusy();
    final _result = await _service.createEvent(eventinfo: eventInfo);
    turnIdle();
    if (_result == null) return null;
    return _result;
  }
}