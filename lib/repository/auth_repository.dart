import 'dart:html';

import 'dart:convert';
import 'package:employee_mobile/model/data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future loginUser(String _email, String _password, String device) async {
    String baseUrl = "http://localhost/api/login";

    try {
      var response = await http.post(Uri.parse(baseUrl), body: {
        'email': _email,
        'password': _password,
        'device_name': device
      });
      var jsonResponse = json.decode(response.body);
      return LoginAuth.fromJson(jsonResponse);
    } catch (e) {
      return e;
    }
  }

  Future userLogout(String token) async {
    String baseUrl = "http://localhost/api/logout";
    try {
      var response = await http.post(Uri.parse(baseUrl), headers: {
        'Authorization': ' Bearer $token',
        'Accept': 'application/json'
      });
      var resbody = json.decode(response.body);
      return Logout.fromJson(resbody);
    } catch (e) {
      return e;
    }
  }

  Future getData(String token) async {
    String baseUrl = "http://localhost/api/profile";
    try {
      var response = await http.get(Uri.parse(baseUrl), headers: {
        'Authorization': ' Bearer $token',
        'Accept': 'application/json'
      });

      var body = json.decode(response.body);
      return User.fromJson(body);
    } catch (e) {
      return e;
    }
  }

  Future hasToken() async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    final String token = local.getString('token_sanctum')!;
    if (token != null) return token;
    return null;
  }

  Future setLocalToken(String token) async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    local.setString("token_sanctum", token);
  }

  Future unsetLocalToken() async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences local = await _pref;
    local.setString("token_sanctum", null.toString());
  }
}
