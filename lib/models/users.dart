class Users {

  String _id;
  String _name;
  String _username;
  String _phone;
  String _password;
  String _role;
  String _faculty;

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get phone => _phone;
  set phone(value) => _phone = value;

  get password => _password;
  set password(value) => _password = value;

  get role => _role;
  set role(value) => _role = value;

  get faculty => _faculty;
  set faculty(value) => _faculty = value;

  get username => _username;
  set username(value) => _username = value;

  Users({String id='', String name='', String phone='', String password='', String role='', String faculty='',
    String username=''
  })
    : _id = id,
    _name = name,
    _phone = phone,
    _password = password,
    _role = role,
    _faculty = faculty,
    _username = username;

  Users.copy(Users from)
    : this(
      id: from.id,
      name: from.name,
      phone: from.phone,
      password: from.password,
      role: from.role,
      faculty: from.faculty,
      username: from.username
    );

    Users.fromJson(Map<String, dynamic> json)
        : this(
            id: json['id'] ?? '',
            name: json['name'] ?? '',
            phone: json['phone'] ?? '',
            password: json['password'] ?? '',
            role: json['role'] ?? '',
            faculty: json['faculty'] ?? '',
            username: json['username'] ?? ''
          );

    Map<String, dynamic> toJson() => {
      'name': name,
      'phone': phone,
      'password': password,
      'role': role,
      'faculty': faculty,
      'username': username
    };

}