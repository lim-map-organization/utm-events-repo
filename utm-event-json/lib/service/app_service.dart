import 'package:baoren_workplace/model/appointment.dart';
import 'rest.dart';

class AppService {
  static Future<List<Appointment>> getAppointmentListByUser(int userId) async {
    final List listJson = await Rest.get('appointment?user=$userId');
    //Convert response to object
    return listJson.map((json) => Appointment.fromJson(json)).toList();
  }

  static Future<List<Appointment>> getAppointmentListByStaff(int userId) async {
    final List listJson = await Rest.get('appointment?staff=$userId');
    //Convert response to object
    return listJson.map((json) => Appointment.fromJson(json)).toList();
  }

  static Future<Appointment> addAppointment(Appointment appointment) async {
    //Add the item except the id 
    final json = await Rest.post('appointment', data: appointment); 
    return Appointment.fromJson(json);
  }

  static Future<Appointment> updateAppointment(Appointment appointment) async {
    final json = await Rest.patch('appointment/${appointment.id}',data: appointment);
    return Appointment.fromJson(json);
  }

  static Future<void> removeAppointment(Appointment appointment) async {
    await Rest.delete('appointment/${appointment.id}');
    //return Todo.fromJson(json);
  }
}
