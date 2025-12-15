import 'package:flutter/material.dart';

class MyWelcome extends StatelessWidget {
  const MyWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyWelcome"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            block1(),
            SizedBox(height: 24),
            block2(),
            SizedBox(height: 24),
            block3(),
            SizedBox(height: 24),
            block4(),
            SizedBox(height: 16),
            block5(),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(Icons.notifications_none, size: 28),
        SizedBox(width: 16),
        Icon(Icons.extension, size: 28),
      ],
    );
  }

  Widget block2() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Welcome,\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Charlie',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget block4() {
    return Text(
      'Saved Places',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget block5() {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _buildImage('assets/images/picture1.png'),
          _buildImage('assets/images/picture2.png'),
          _buildImage('assets/images/picture3.png'),
          _buildImage('assets/images/picture4.png'),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12), // bo góc
      child: Image.asset(
        path,
        fit: BoxFit.cover, // zoom ảnh vừa khung
      ),
    );
  }
}
