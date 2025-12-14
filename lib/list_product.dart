import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/model/product.dart';

class MyProductName extends StatefulWidget {
  const MyProductName({super.key});

  @override
  State<MyProductName> createState() => _MyProductState();
}

class _MyProductState extends State<MyProductName> {
  void initState() {
    super.initState();
    test_api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: test_api.getAllProduct(), 
        builder: (context, snap){
          if(snap.connectionState == ConnectionState.done){
            return myListProduct(snap.data!);
          }
          else{
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }
  Widget myListProduct(List<Product> listProduct) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: listProduct.map((p) => myProduct(p)).toList(),
    );
  }
  Widget myProduct(Product p){
    return Text(p.title);
  }
}