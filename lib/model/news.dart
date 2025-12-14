class NewsResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? 'error',
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List?)
              ?.map((item) => Article.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class Article {
  final Source? source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'] != null ? Source.fromJson(json['source']) : null,
      author: json['author'], // Có thể null
      title: json['title'] ?? 'Không có tiêu đề',
      description: json['description'] ?? 'Không có mô tả',
      url: json['url'] ?? '',
      // Nếu không có ảnh, dùng ảnh mặc định
      urlToImage: json['urlToImage'] ?? 'https://via.placeholder.com/150', 
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

class Source {
  final String? id;
  final String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}