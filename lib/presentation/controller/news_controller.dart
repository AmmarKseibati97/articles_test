import 'package:get/get.dart';

import '../../core/services/services_locator.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/usecase/get_apple_articles_usecase.dart';

class NewsController extends GetxController {
  final RxString keyword1 = ''.obs;
  final RxString keyword2 = ''.obs;
  RxString error1 = ''.obs;
  RxString error2 = ''.obs;
  RxList<News> newsList1 = <News>[].obs;
  RxList<News> newsList2 = <News>[].obs;

  updateKeyword1(String text) async {
    final result = await sl<GetArticlesUseCase>()(text);
    result.fold((l) {
      error1 = l.message;
    }, (r) {
      newsList1.assignAll(r);
    });
  }

  void updateKeyword2(String text) async {
    final result = await sl<GetArticlesUseCase>()(text);
    result.fold((l) {
      error2 = l.message;
    }, (r) {
      newsList2.assignAll(r);
    });
  }
}
