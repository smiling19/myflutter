import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/product.dart';

class API {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    var respone = await dio.request('https://fakestoreapi.com/products');
    List<Product> listProduct = [];
    if (respone.statusCode == 200) {
      List data = respone.data;
      listProduct = data.map((x)=>Product.fromJson(x)).toList();
    }
    else {
      print('Loi');
    }
    return listProduct;
  }
}

var test_api = API();
