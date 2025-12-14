import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(),
    );
  }

  Widget MyBody() {
    return Column(
      children: [
        block1(),
        block2(),
        block3(),
        block4(),
      ],
    );
}
Widget block1() {
  var src = "https://images.unsplash.com/photo-1754769440490-2eb64d715775?q=80&w=1113&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  return Image.network(src, width: double.infinity, height: 240, fit: BoxFit.cover);
  }

Widget block2() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gái nhắm mắt",
              style: TextStyle(color: Colors.pink, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ảnh đen trắng",
              style: TextStyle(color: Colors.pink, fontSize: 14),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.red),
            SizedBox(width: 4),
            Text(
              "41",
              style: TextStyle(color: Colors.pink, fontSize: 11),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget block3() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.call, color: Colors.blue),
          SizedBox(height: 4),
          Text(
            "CALL",
            style: TextStyle(color: Colors.blue, fontSize: 11),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(Icons.near_me, color: Colors.blue),
          SizedBox(height: 4),
          Text(
            "ROUTE",
            style: TextStyle(color: Colors.blue, fontSize: 11),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(Icons.share, color: Colors.blue),
          SizedBox(height: 4),
          Text(
            "SHARE",
            style: TextStyle(color: Colors.blue, fontSize: 11),
          ),
        ],
      ),
    ],
  );
}

Widget block4() {
  var str = "Lake Oechinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. ";
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Text(str),
  );
  }
}