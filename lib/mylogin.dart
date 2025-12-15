import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/loginapi.dart';

import 'myprofile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  // Set giá trị mặc định để test cho nhanh
  final TextEditingController _usernameController = TextEditingController(text: "emilys");
  final TextEditingController _passwordController = TextEditingController(text: "emilyspass");

  bool _obscurePassword = true;
  bool _isLoading = false;
  final LoginApi _loginApi = LoginApi(); // Khởi tạo API service

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      // Gọi API Login
      final result = await _loginApi.login(
        _usernameController.text, 
        _passwordController.text
      );

      setState(() => _isLoading = false);

      if (result != null) {
        // Đăng nhập thành công -> Chuyển màn hình, truyền Token qua
        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyProfile(token: result.accessToken),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Xin chào, ${result.firstName}!')),
        );
      } else {
        // Đăng nhập thất bại
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sai tài khoản hoặc mật khẩu')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng nhập"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
                validator: (v) => v!.isEmpty ? 'Nhập username' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: (v) => v!.isEmpty ? 'Nhập password' : null,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  child: _isLoading 
                    ? CircularProgressIndicator(color: Colors.white) 
                    : Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}