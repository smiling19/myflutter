import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

bool isValidEmail(String email) {
  // Biểu thức chính quy kiểm tra định dạng email
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    bool _obscurePassword = false;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Form đăng kí tài khoản'),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formKey, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                    labelText: 'Họ tên',
                    border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) 
                    return 'Vui lòng nhập Họ tên';
                    return null;
                }  
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) 
                    return 'Vui lòng nhập Email';
                  else if (!isValidEmail(value))
                    return 'Email không hợp lệ';
                  return null;
                } 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                    labelText: 'Mật khẩu',
                    suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    }, 
                    icon: Icon (_obscurePassword ? Icons.visibility_off : Icons.visibility)),
                    border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) 
                    return 'Vui lòng nhập Mật khẩu';
                  return null;
                } 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                    labelText: 'Xác nhận mật khẩu',
                    suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    }, 
                    icon: Icon (_obscurePassword ? Icons.visibility_off : Icons.visibility)),
                    border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) 
                    return 'Vui lòng nhập Xác nhận mật khẩu';
                  return null;
                } 
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng kí thành công'))
                  );
                }
              },
              
              child: Text('Đăng kí'),
            )
          ],
        )
      ),
    );
  }
}
