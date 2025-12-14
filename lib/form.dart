import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Form Đăng nhập')),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Tên đăng nhập',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) 
                    return 'Vui lòng nhập tên đăng nhập';
                    return null;
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextFormField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Nhập Mật khẩu',
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
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đăng nhập thành công'))
                  );
                }
              },
              child: Text('Đăng nhập'),
        
            ),
          ],
        ),
      ),
    );
  }

}