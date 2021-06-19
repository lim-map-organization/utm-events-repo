class User {
  int _id;
  String _username;
  String _email;
  String _phoneNo;
  String _password;
  String _identity;
  String _organization;

  get id => _id;
  set id(value) => _id = value;

  get username => _username;
  set username(value) => _username = value;

  get email => _email;
  set email(value) => _email = value;

  get phoneNo => _phoneNo;
  set phoneNo(value) => _phoneNo = value;

  get password => _password;
  set password(value) => _password = value;

  get identity => _identity;
  set identity(value) => _identity = value;

  get organization => _organization;
  set organization(value) => _organization = value;

  User(
      {int id,
      String username = '',
      String email = '',
      String phoneNo = '',
      String password = '',
      String identity = '',
      String organization = ''})
      : _id = id,
        _username = username,
        _email = email,
        _phoneNo = phoneNo,
        _password = password,
        _identity = identity,
        _organization = organization;

  User.copy(User from)
      : this(
            id: from.id,
            username: from.username,
            email: from.email,
            phoneNo: from.phoneNo,
            password: from.password,
            identity: from.identity,
            organization: from.organization);


  //from Json
  User.fromJson(Map<String, dynamic> json): 
    this(id: json['id'], username: json['username'], email: json['email'], phoneNo:json['phoneNo'], password:json['password'],organization:json['organization'],identity:json['identity']);

  //toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phoneNo': phoneNo,
        'password': password,
        'organization': organization,
        'identity': identity,
      };
  }