import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/profile.dart';
import 'package:flutter_application_1/api/profileapi.dart';
import 'mylogin.dart';

class MyProfile extends StatefulWidget {
  final String token;

  const MyProfile({super.key, required this.token});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Profile? _userProfile;
  bool _isLoading = true;
  final ProfileApi _profileApi = ProfileApi();

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final profile = await _profileApi.getMe(widget.token);
    setState(() {
      _userProfile = profile;
      _isLoading = false;
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyLogin()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hồ sơ cá nhân"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Đăng xuất',
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _userProfile == null
          ? Center(child: Text("Lỗi tải dữ liệu hoặc Token hết hạn"))
          : SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(_userProfile!.image),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "${_userProfile!.firstName} ${_userProfile!.lastName}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "@${_userProfile!.username}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(height: 30),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Email"),
                    subtitle: Text(_userProfile!.email),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("Phone"),
                    subtitle: Text(_userProfile!.phone),
                  ),
                  ListTile(
                    leading: Icon(Icons.cake),
                    title: Text("Ngày sinh"),
                    subtitle: Text(_userProfile!.birthDate),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _logout,
                    icon: Icon(Icons.logout),
                    label: Text("Đăng xuất"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
