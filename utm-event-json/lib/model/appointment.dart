class Appointment {
  int _id;
  String _title;
  String _date;
  String _time;
  int _staff;
  String _reason;
  int _user;
  String _organization;
  String _status;

  get id => _id;
  set id(value) => _id = value;
  
  get user => _user;
  set user(value) => _user = value;

  get title => _title;
  set title(value) => _title = value;

  get date => _date;
  set date(value) => _date = value;

  get time => _time;
  set time(value) => _time = value;

  get staff => _staff;
  set staff(value) => _staff = value;

  get reason => _reason;
  set reason(value) => _reason = value;

  get organization => _organization;
  set organization(value) => _organization = value;

  get status => _status;
  set status(value) => _status = value;

  Appointment(
      {int id,
      String title = '',
      String date = '',
      String time = '',
      int staff,
      String reason = '',
      int user,
      String organization = '',
      String status = ""})
      : _id = id,
        _title = title,
        _date = date,
        _time = time,
        _staff = staff,
        _user = user,
        _reason = reason,
        _status = status,
        _organization = organization;

  Appointment.copy(Appointment from)
      : this(
            id: from.id,
            title: from.title,
            date: from.date,
            time: from.time,
            staff: from.staff,
            reason: from.reason,
            user: from.user,
            status: from.status,
            organization: from.organization);


  //from Json
  Appointment.fromJson(Map<String, dynamic> json): 
    this(id: json['id'], title: json['title'], date: json['date'], time:json['time'], staff:json['staff'],organization:json['organization'],reason:json['reason'],status: json["status"],user:json['user']);

  //toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'time': time,
        'staff': staff,
        'organization': organization,
        'user': user,
        'status': status,
        'reason': reason,
      };
  }