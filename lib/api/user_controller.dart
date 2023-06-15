import 'dart:convert';
// import 'dart:js';

import 'package:employee_mobile/model/data_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  String email;
  String password;
  String profilePicture;

  User(
      {required this.name,
      required this.email,
      required this.password,
      required this.profilePicture});
}

Future<void> updateprofile(User user) async {
  // Mengirim data perubahan profil ke server melalui koneksi API
  // Misalnya menggunakan metode POST pada endpoint '/update_profile'
  // Menggunakan package http: ^0.13.0
  final response = await http
      .post(Uri.parse('http://192.168.2.101:8080/api/user/{id}/update'), body: {
    'name': user.name,
    'email': user.email,
    'password': user.password,
    'profile_picture': user.profilePicture,
  });

  if (response.statusCode == 200) {
    // Berhasil mengirim data
    // Anda dapat melakukan penanganan sesuai kebutuhan, misalnya parsing respons atau menampilkan pesan sukses
  } else {
    // Gagal mengirim data
    // Anda dapat melakukan penanganan kesalahan, misalnya menampilkan pesan error atau melakukan tindakan lain
  }
}

class Repository {
  Future getData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.2.101:8080/api/user'));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<User_data> user = it.map((e) => User_data.fromJson(e)).toList();
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
