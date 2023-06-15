import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_controller.dart';

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}

User currentUser = User(name: '', email: '');

Future<void> getUser() async {
  var url = Uri.parse('http://192.168.2.101:8080/api/user');

  // Tambahkan token autentikasi jika diperlukan
  // headers: {'Authorization': 'Bearer your-token'}

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    currentUser = User.fromJson(jsonData['user']);
    // Mengisi nilai awal pada form
    var nameController, emailController;
    nameController.text = currentUser.name;
    emailController.text = currentUser.email;
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
    // Tambahkan navigasi ke halaman lain jika diperlukan
  } else {
    print('Failed to update user');
    print(response.body);
  }
}

Future<Map<String, dynamic>?> getUserData() async {
  var url = Uri.parse('http://192.168.2.101:8080/api/user');

  // Tambahkan token autentikasi jika diperlukan
  // headers: {'Authorization': 'Bearer your-token'}

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var user = json.decode(response.body);
    return user;
  } else {
    print('Failed to get user data');
    return null;
  }
}
