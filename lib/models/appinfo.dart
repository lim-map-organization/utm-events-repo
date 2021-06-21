class AppInfo {

  String _id;
  String _name;
  String _faculty;
  String _detail;
  String _status;
  String _dateAndTime;
  String _staffid;
  String _studentid;
  String _staffname;
  String _studentname;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get studentname => _studentname;
  set studentname(value) => _studentname = value;

  get staffname => _staffname;
  set staffname(value) => _staffname = value;

  get faculty => _faculty;
  set faculty(value) => _faculty = value;

  get detail => _detail;
  set detail(value) => _detail = value;

  get staffid => _staffid;
  set staffid(value) => _staffid = value;

  get status => _status;
  set status(value) => _status = value;

  get dateAndTime => _dateAndTime;
  set dateAndTime(value) => _dateAndTime = value;

  get studentid => _studentid;
  set studentid(value) => _studentid = value;

  AppInfo({String id='', String name='', String faculty='', String detail='', String staffid='', String dateAndTime='', String studentid='', String status='',
  String staffname='', String studentname=''})
    : _id = id,
    _name = name,
    _faculty = faculty,
    _detail = detail,
    _staffid = staffid,
    _dateAndTime = dateAndTime,
    _studentid = studentid,
    _status = status,
    _staffname = staffname,
    _studentname = studentname;

  AppInfo.copy(AppInfo from)
    : this(
      id: from.id,
      faculty: from.faculty,
      name: from.name,
      detail: from.detail,
      staffid: from.staffid,
      dateAndTime: from.dateAndTime,
      studentid: from.studentid,
      status: from.status,
      staffname: from.staffname,
      studentname: from.studentname
    );

  AppInfo.fromJson(Map<String, dynamic> json)
        : this(
            id: json['id'] ?? '',
            name: json['name'] ?? '',
            faculty: json['faculty'] ?? '',
            detail: json['detail'] ?? '',
            staffid: json['staffid'] ?? '',
            dateAndTime: json['dateAndTime'] ?? '',
            studentid: json['studentid'] ?? '',
            status: json['status'] ?? ''
          );

    Map<String, dynamic> toJson() => {
      'name': name,
      'faculty': faculty,
      'detail': detail,
      'staffid': staffid,
      'dateAndTime': dateAndTime,
      'studentid': studentid,
      'status': status
    };
}