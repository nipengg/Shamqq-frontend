import 'dart:convert';

import 'package:shamqq_frontend/models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionService{

  // Local Web Server API
  // String baseUrl = 'https://shamqq-backend.test/api';
  // String baseUrl = 'http://192.168.1.5:8000/api';

  // BuildWithAngga API
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(String token, List<CartModel> carts, double totalPrice) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Bogor',
      'items': carts.map((cart) => {
        'id': cart.product.id,
        'quantity': cart.quantity,
      }).toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    }
    else{
      throw Exception('Checkout Failed');
    }
  }
}