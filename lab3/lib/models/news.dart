class NewsResponse {
  List<News> data;

  NewsResponse({
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    data: List<News>.from(json["articles"].map((n) => News.fromJson(n))),
  );
}

class News {
  String title;
  String description;
  DateTime publishedAt;

  News({
    required this.title,
    required this.description,
    required this.publishedAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    title: json["title"],
    description: json["description"].toString(),
    publishedAt: DateTime.parse(json["publishedAt"]),
  );
}
