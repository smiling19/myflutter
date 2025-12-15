import 'package:flutter/material.dart';

// --- IMPORT CÁC FILE THEO CẤU TRÚC BÀI TẬP ---

// Bài 1
import 'myplace.dart';

// Bài 2
import 'my_classroom.dart'; // Bạn kiểm tra lại tên file này trong máy nhé

// Bài 3
import 'mywelcome.dart';

// Bài 4
import 'changecolor.dart';
import 'demnguocso.dart'; // Nếu chưa có file này thì comment dòng này lại
import 'demso.dart';

// Bài 5
import 'register.dart'; // DangKi.png
import 'form.dart';     // DangNhap.png (Form UI)

// Bài 6
import 'my_product.dart';    // api.dart, product.dart (API)
// import 'list_product.dart';  // DanhSachSanPham (Tĩnh)

// Bài 7
import 'routing.dart'; // Tin tức API

// Bài 8
import 'mylogin.dart'; // Login API -> Chuyển sang Profile


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // --- HEADER ---
          UserAccountsDrawerHeader(
            accountName: const Text("Menu Bài Tập"),
            accountEmail: const Text("Lê Hoài Phương - 22T1020337"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(Icons.folder_copy, size: 40, color: Colors.blue),
            ),
            decoration: const BoxDecoration(color: Colors.blue),
          ),

          //BÀI 1
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 1: MyPlace'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPlace()));
            },
          ),

          //BÀI 2
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 2: MyClassroom'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyClassroom())); 
            },
          ),

          //BÀI 3
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 3: MyWelcome'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWelcome()));
            },
          ),

          //BÀI 4
          ExpansionTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text("Bài 4: Chức năng cơ bản"),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.color_lens),
                title: const Text('Change Color'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ColorChangerApp()));
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.timer),
                title: const Text('Đếm Ngược Số'),
                onTap: () {
                  Navigator.pop(context);
                  // Kiểm tra tên Class trong file demnguocso.dart
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DemNguocSo())); 
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.exposure_plus_1),
                title: const Text('Đếm Số'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DemSo()));
                },
              ),
            ],
          ),

          //BÀI 5
          ExpansionTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text("Bài 5: Form UI"),
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.app_registration),
                title: const Text('Đăng Ký (Register)'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyRegister()));
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.login),
                title: const Text('Đăng Nhập (Form Only)'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyForm()));
                },
              ),
            ],
          ),

          //BÀI 6
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 6: MyProduct (API)'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProduct()));
            },
          ),

          //BÀI 7
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 7: Tin Tức (API)'),
            subtitle: const Text('Danh sách & Chi tiết'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyRouting()));
            },
          ),

          //BÀI 8
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.redAccent),
            title: const Text('Bài 8: Hệ thống User'),
            subtitle: const Text('Login API -> Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyLogin()));
            },
          ),
        ],
      ),
    );
  }
}