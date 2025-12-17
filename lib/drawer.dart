import 'package:flutter/material.dart';
import 'myplace.dart';
import 'my_classroom.dart';
import 'mywelcome.dart';
import 'changecolor.dart';
import 'demnguocso.dart';
import 'demso.dart';
import 'register.dart';
import 'form.dart';
import 'my_product.dart';
import 'routing.dart';
import 'mylogin.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
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
            title: const Text("Bài 4: StatefulWidget"),
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
                title: const Text('Register'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyRegister()));
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 32),
                leading: const Icon(Icons.login),
                title: const Text('Login'),
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
            leading: const Icon(Icons.folder, color: Colors.amber),
            title: const Text('Bài 8: Login (API)'),
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