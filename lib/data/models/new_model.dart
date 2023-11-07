import '../../domain/entities/news_entity.dart';

class NewsModel extends News {
  const NewsModel(
      {super.id,
      required super.name,
      super.author,
      required super.title,
      super.description,
      required super.url,
      super.urlToImage,
      required super.publishedAt,
      super.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["source"]["id"] ?? "",
        name: json["source"]["name"] ?? "",
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: json["publishedAt"] ?? "",
        content: json['content'] ?? "",
      );
}
