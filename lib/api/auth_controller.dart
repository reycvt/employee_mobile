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
      Uri.parse("http://192.168.1.10:8080/api/login"),
      body: jsonEncode({"email": email, "password": password}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    if (response.statusCode != 200) return;
    Get.to(() => MenuScreen());
  }
}
