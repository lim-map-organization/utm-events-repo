import 'package:baoren_workplace/model/news.dart';
import 'rest.dart';

class NewsService {
  static Future<List<News>> getNewsList() async {
    final List listJson = await Rest.get('news');
    //Convert response to object
    return listJson.map((json) => News.fromJson(json)).toList();
  }
}
