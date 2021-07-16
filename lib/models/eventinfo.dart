class EventInfo {

  String _id;
  String _name;
  String _venue;
  String _timeslot;
  String _organization;
  String _code;
  String _contact;
  String _status;
  String _dateAndTime;
  String _studentid;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get timeslot => _timeslot;
  set timeslot(value) => _timeslot = value;

  get venue => _venue;
  set venue(value) => _venue = value;

  get organization => _organization;
  set organization(value) => _organization = value;

  get code => _code;
  set code(value) => _code = value;

  get contact => _contact;
  set contact(value) => _contact = value;

  get status => _status;
  set status(value) => _status = value;

  get dateAndTime => _dateAndTime;
  set dateAndTime(value) => _dateAndTime = value;

  get studentid => _studentid;
  set studentid(value) => _studentid = value;

  EventInfo({String id='', String name='', String venue='', String organization='', String code='', 
    String contact='', String timeslot='', String dateAndTime='', String studentid='', String status=''
  })
    : _id = id,
    _name = name,
    _venue = venue,
    _organization = organization,
    _code = code,
    _contact = contact,
    _timeslot = timeslot,
    _dateAndTime = dateAndTime,
    _studentid = studentid,
    _status = status;

  EventInfo.copy(EventInfo from)
    : this(
      id: from.id,
      venue: from.venue,
      name: from.name,
      organization: from.organization,
      code: from.code,
      contact: from.contact,
      timeslot: from.timeslot,
      dateAndTime: from.dateAndTime,
      studentid: from.studentid,
      status: from.status
    );

  EventInfo.fromJson(Map<String, dynamic> json)
        : this(
            id: json['id'] ?? '',
            name: json['name'] ?? '',
            dateAndTime: json['dateAndTime'] ?? '',
            studentid: json['studentid'] ?? '',
            status: json['status'] ?? '',
            venue: json['venue'] ?? '',
            organization: json['organization'] ?? '',
            code: json['code'] ?? '',
            contact: json['contact'] ?? '',
            timeslot: json['timeslot'] ?? ''
          );

    Map<String, dynamic> toJson() => {
      'name': name,
      'venue': venue,
      'organization': organization,
      'code': code,
      'contact': contact,
      'timeslot': timeslot,
      'dateAndTime': dateAndTime,
      'studentid': studentid,
      'status': status
    };
}