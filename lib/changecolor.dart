import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ứng dụng Đổi màu nền',
      home: const ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color backgroundColor = Colors.purple;
  String colorName = "Tím";

  // Danh sách các màu và tên tương ứng
  final List<Map<String, dynamic>> colorList = [
    {'color': Colors.red, 'name': 'Đỏ'},
    {'color': Colors.green, 'name': 'Xanh lá'},
    {'color': Colors.blue, 'name': 'Xanh dương'},
    {'color': Colors.yellow, 'name': 'Vàng'},
    {'color': Colors.orange, 'name': 'Cam'},
    {'color': Colors.purple, 'name': 'Tím'},
    {'color': Colors.pink, 'name': 'Hồng'},
    {'color': Colors.teal, 'name': 'Xanh ngọc'},
  ];

  void changeColor() {
    final random = Random();
    final randomIndex = random.nextInt(colorList.length);
    setState(() {
      backgroundColor = colorList[randomIndex]['color'];
      colorName = colorList[randomIndex]['name'];
    });
  }

  void resetColor() {
    setState(() {
      backgroundColor = Colors.black;
      colorName = 'Đen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng Đổi màu nền'),
        backgroundColor: Colors.teal,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Màu hiện tại:',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                colorName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeColor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text('Đổi màu'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: resetColor,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Đặt lại'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
