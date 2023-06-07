import 'dart:convert';

class LoginAuth {
  late String message;
  late TokenAuth data;
  LoginAuth({required this.message, required this.data});
  LoginAuth.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = TokenAuth.fromJson(json['data']);
  }
}

class TokenAuth {
  late String token;
  TokenAuth({required this.token});

  TokenAuth.fromJson(Map<String, dynamic> data) {
    token = data['token'];
  }
}

class User {
  late String name;
  late String email;
  User({required this.name, required this.email});

  User.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      name = json['data']['name'];
      email = json['data']['email'];
    }
  }
}

class Logout {
  late String message;

  Logout({required this.message});

  Logout.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
