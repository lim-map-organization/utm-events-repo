import 'package:map_project/models/news.dart';
import 'package:map_project/services/news/new_service.dart';

class NewsServiceMock implements NewsService {
  Future<List<News>> getNews() async {
    List<News> _newsList = _news;
    return _newsList;
  }

}

final _news = <News>[
  News(id: 1, title: "Cuti Umum Hari Pekerja", desc: "Hari Pekerja adalah sambutan pencapaian ekonomi dan sosial pekerja.", photo:"worker.jpg"),
  News(id: 2, title: "Kawasan Larang Rokok", desc: "UTM telah menguatkuasa tempat larang merokok mulai 30 April 2021.", photo:"xsmoke.jpg"),
  News(id: 3, title: "Amalan Meraih Ganjaran", desc: "Aktiviti ini dijalankan untuk meraih ganjaran Al-Qadr bagi wanita.", photo:"woman.jpg"),

];