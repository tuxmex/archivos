import 'package:news_mobile/repositories/repository.dart';

class NewsService {
  Repository _repository;

  NewsService() {
    _repository = Repository();
  }

  getFeaturedNews() async {
    return await _repository.httpGet('/news/get-featured-news');
  }

  getAllNews() async {
    return await _repository.httpGet('/news/get-all');
  }
}
