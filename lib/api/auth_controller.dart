import 'dart:convert';

import 'package:employee_mobile/pages/homeScreen.dart';
import 'package:employee_mobile/pages/menuScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  var logger = Logger();
  // var data = {"email": "admin@admin.com", "password": "password"};
  Future login(String email, password) async {
    var response = await http.post(
      Uri.parse("http://192.168.2.101:8080/api/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode != 200) return;
    Get.to(() => MenuScreen());
  }

  Future<void> getUser() async {
    var url = Uri.parse('http://192.168.2.101:8080/api/user');

    // Tambahkan token autentikasi jika diperlukan
    // headers: {'Authorization': 'Bearer your-token'}

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print('User details:');
      print(response.body);
    } else {
      print('Failed to get user details');
      print(response.body);
    }
  }

  Future<void> updateUser(String name, String email, String password) async {
    var url = Uri.parse('http://192.168.2.101:8080/api/user');

    // Tambahkan token autentikasi jika diperlukan
    // headers: {'Authorization': 'Bearer your-token'}

    var response = await http.put(url, body: {
      'name': name,
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      print('User updated');
      print(response.body);
    } else {
      print('Failed to update user');
      print(response.body);
    }
  }
}
