import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/news_controller.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Keyword 1'),
              onSubmitted: (text) {
                newsController.updateKeyword1(text);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Keyword 2'),
              onSubmitted: (text) {
                newsController.updateKeyword2(text);
              },
            ),
            Obx(() {
              return Expanded(
                child: Column(
                  children: [
                    Text("Results for Keyword 1: ${newsController.keyword1}"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newsController.newsList1.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              title:
                                  Text(newsController.newsList1[index].title),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
            Obx(() {
              return Expanded(
                child: Column(
                  children: [
                    Text("Results for Keyword 2: ${newsController.keyword2}"),
                    Expanded(
                      child: ListView.builder(
                        itemCount: newsController.newsList2.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: ListTile(
                              title:
                                  Text(newsController.newsList2[index].title),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
