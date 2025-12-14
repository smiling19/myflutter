import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/profile.dart';

class ProfileApi {
  final Dio _dio = Dio();

  Future<Profile?> getMe(String accessToken) async {
    try {
      final response = await _dio.get(
        'https://dummyjson.com/auth/me',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      } else {
        print('Get Profile Failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Profile API Error: $e');
      return null;
    }
  }
}