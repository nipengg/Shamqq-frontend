import 'dart:convert';

import 'package:shamqq_frontend/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService{

  // Local Web Server API
  // String baseUrl = 'https://shamqq-backend.test/api';
  // String baseUrl = 'http://192.168.1.5:8000/api';

  // BuildWithAngga API
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';


  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      return products;
    }
    else {
      throw Exception('Get Products Failed');
    }
  }
}