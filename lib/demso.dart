import 'package:flutter/material.dart';

class DemSo extends StatefulWidget {
  @override
  State<DemSo> createState() => __CountNumberAppState();
}

class __CountNumberAppState extends State<DemSo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ứng dụng Đếm số"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Giá trị hiện tại:",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              '$_count',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _count--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Giảm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _count = 0;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Đặt lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Tăng'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
