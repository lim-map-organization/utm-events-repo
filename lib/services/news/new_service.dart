import 'package:map_project/models/news.dart';

abstract class NewsService {
  Future<List<News>> getNews();
}