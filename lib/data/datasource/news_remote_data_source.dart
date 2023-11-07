import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../core/error/exceptios.dart';
import '../../core/network/error_message_model.dart';
import '../models/new_model.dart';

abstract class BaseNewsRemoteDataSource {
  Future<RxList<NewsModel>> getArticles(String seaechedText);
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<RxList<NewsModel>> getArticles(String seaechedText) async {
    final response = await dio.get(
        "https://newsapi.org/v2/everything?q=$seaechedText&from=2023-10-07&sortBy=publishedAt&apiKey=8b15d928c63a42318683be4bc89e268a",
        options: Options(
          validateStatus: (_) => true,
        ));
    if (response.statusCode == 200) {
      return RxList<NewsModel>.from((response.data["articles"] as List)
          .map((e) => NewsModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formJson(response.data.obs));
    }
  }
}
