import 'dart:convert';

import 'package:shamqq_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService{

  // Local Web Server API
  // String baseUrl = 'https://shamqq-backend.test/api';
  // String baseUrl = 'http://192.168.1.5:8000/api';

  // BuildWithAngga API
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register({String name, String username, String email, String password}) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
     Uri.parse(url),
     headers: headers,
     body: body,
    );

    print(response.body);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    }
    else{
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({String email, String password}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
     Uri.parse(url),
     headers: headers,
     body: body,
    );

    print(response.body);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    }
    else{
      throw Exception('Gagal Login');
    }
  }
}