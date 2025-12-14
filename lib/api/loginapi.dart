import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/login.dart';

class LoginApi {
  final Dio _dio = Dio();

  Future<Login?> login(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30, // Tùy chọn
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status! < 500, // Cho phép xử lý code 400/401
        ),
      );

      if (response.statusCode == 200) {
        return Login.fromJson(response.data);
      } else {
        print('Login failed: ${response.data['message']}');
        return null;
      }
    } catch (e) {
      print('Login Error: $e');
      return null;
    }
  }
}