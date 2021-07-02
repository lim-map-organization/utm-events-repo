class News{
  int _id;
  String _title;
  String _desc;
  String _photo;


  get id => _id;
  set id(value) => _id = value;

  get title => _title;
  set title(value) => _title = value;

  get desc => _desc;
  set desc(value) => _desc = value;

  get photo => _photo;
  set photo(value) => _photo = value;


  News(
      {
      int id=0,
      String title = '',
      String desc = '',
      String photo = '',
    })
      : _id = id,
        _title = title,
        _desc = desc,
        _photo = photo;

  News.copy(News from)
      : this(
            id: from.id,
            title: from.title,
            desc: from.desc,
            photo: from.photo,);


  //from Json
  News.fromJson(Map<String, dynamic> json): 
    this(id: json['id'], title: json['title'], desc: json['desc'], photo:json['photo']);

  //toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'photo': photo,
      };
  }