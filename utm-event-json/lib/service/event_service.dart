import 'package:baoren_workplace/model/event.dart';
import 'rest.dart';

class EventService {
  static Future<List<Event>> getEventListByUser(int userId) async {
    final List listJson = await Rest.get('event?user=$userId');
    //Convert response to object
    return listJson.map((json) => Event.fromJson(json)).toList();
  }

  static Future<List<Event>> getEventList() async {
    final List listJson = await Rest.get('event');
    //Convert response to object
    return listJson.map((json) => Event.fromJson(json)).toList();
  }

  static Future<Event> addEvent(Event event) async {
    //Add the item except the id 
    final json = await Rest.post('event', data: event); 
    return Event.fromJson(json);
  }

  static Future<Event> updateEvent(Event event) async {
    final json = await Rest.patch('event/${event.id}',data: event);
    return Event.fromJson(json);
  }

  static Future<void> removeEvent(Event event) async {
    await Rest.delete('event/${event.id}');
    //return Todo.fromJson(json);
  }
}
