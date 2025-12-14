import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody() {
    // Danh sách dữ liệu (thêm cả ảnh nền)
    final List<Map<String, String>> classes = [
      {
        "title": "XML và ứng dụng - Nhóm 1",
        "subtitle": "2025-2026.1.TIN4583.001",
        "siso": "58 học viên",
        "image":
            "https://images.unsplash.com/photo-1517994112540-009c47ea476b?q=80&w=1206"
      },
      {
        "title": "Lập trình ứng dụng cho các t...",
        "subtitle": "2025-2026.1.TIN4403.006",
        "siso": "55 học viên",
        "image":
            "https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=1206"
      },
      {
        "title": "Lập trình ứng dụng cho các t...",
        "subtitle": "2025-2026.1.TIN4403.005",
        "siso": "52 học viên",
        "image":
            "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?q=80&w=1206"
      },
      {
        "title": "Lập trình ứng dụng cho các t...",
        "subtitle": "2025-2026.1.TIN4403.004",
        "siso": "50 học viên",
        "image":
            "https://images.unsplash.com/photo-1529101091764-c3526daf38fe?q=80&w=1206"
      },
      {
        "title": "Lập trình ứng dụng cho các t...",
        "subtitle": "2025-2026.1.TIN4403.003",
        "siso": "52 học viên",
        "image":
            "https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?q=80&w=1206"
      },
    ];

    return ListView.builder(
      itemCount: classes.length,
      itemBuilder: (context, index) {
        return item(
          title: classes[index]["title"]!,
          subtitle: classes[index]["subtitle"]!,
          siSo: classes[index]["siso"]!,
          imageUrl: classes[index]["image"]!,
        );
      },
    );
  }

  Widget item({
    required String title,
    required String subtitle,
    required String siSo,
    required String imageUrl,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
              Text(siSo, style: const TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz, color: Colors.white))
        ],
      ),
    );
  }
}
