import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/model/news.dart';
import 'package:flutter_application_1/api/newsapi.dart';

class MyRouting extends StatefulWidget {
  const MyRouting({super.key});

  @override
  State<MyRouting> createState() => _MyRoutingState();
}

class _MyRoutingState extends State<MyRouting> {
  late Future<List<Article>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = API().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin Tức Tổng Hợp'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Article>>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } 
          else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              separatorBuilder: (ctx, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final article = snapshot.data![index];
                return _buildNewsItem(article);
              },
            );
          } 
          else {
            return const Center(child: Text('Không có dữ liệu'));
          }
        },
      ),
    );
  }

  Widget _buildNewsItem(Article article) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(article: article),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.network(
                article.urlToImage,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.description,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(article.url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết bài viết'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.urlToImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, stack) => const SizedBox(
                height: 250,
                child: Center(child: Icon(Icons.broken_image, size: 50)),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.source?.name != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        article.source!.name!,
                        style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
                      ),
                    ),

                  Text(
                    article.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Text(
                    "Ngày đăng: ${article.publishedAt}",
                    style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                  ),

                  const Divider(height: 30),

                  Text(
                    article.description,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _launchURL,
                      icon: const Icon(Icons.public),
                      label: const Text('Đọc bài gốc trên Website'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}