import 'package:flutter/material.dart';
import 'package:flutter_application_1/mylogin.dart';
import 'package:flutter_application_1/list_product.dart';
import 'package:flutter_application_1/my_product.dart';
import 'package:flutter_application_1/routing.dart';
import 'package:flutter_application_1/form.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/mywelcome.dart';
import 'package:flutter_application_1/demnguocso.dart';
import 'package:flutter_application_1/changecolor.dart';
import 'package:flutter_application_1/demso.dart';
import 'package:flutter_application_1/my_classroom.dart';
import 'package:flutter_application_1/myplace.dart';
import 'package:flutter_application_1/mytravel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemNguocSo(),
    );
  } 
}
      