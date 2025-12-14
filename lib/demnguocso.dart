import 'dart:async';
import 'package:flutter/material.dart';

class DemNguocSo extends StatefulWidget {
  @override
  State<DemNguocSo> createState() => _CountdownTimerAppState();
}

class _CountdownTimerAppState extends State<DemNguocSo> {
  TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel(); // Hủy timer khi widget bị dispose
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _seconds = int.tryParse(_controller.text) ?? 0;
      _isRunning = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          timer.cancel();
          _isRunning = false;
          _showTimeUpDialog();
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
      _timer?.cancel();
      _isRunning = false;
      _seconds = 0;
      _controller.clear();
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Thông báo"),
        content: const Text("⏰ Hết thời gian!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("⏳ Bộ đếm thời gian"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nhập số giây cần đếm:",
                border: OutlineInputBorder(),
              ),
              enabled: !_isRunning,
            ),
            const SizedBox(height: 30),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? null : _startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Bắt đầu"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
