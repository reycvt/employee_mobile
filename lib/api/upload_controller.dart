import 'dart:convert';
import 'dart:io';

import 'package:employee_mobile/pages/homeScreen.dart';
import 'package:employee_mobile/pages/menuScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class UploadController extends GetxController {
  var logger = Logger();
  // var data = {"email": "admin@admin.com", "password": "password"};
  // Future upload(String email, password) async {
  //   var response = await http.post(
  //     Uri.parse("http://192.168.1.80:8080/api/login"),
  //     body: jsonEncode({"email": email, "password": password}),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   print(response.body);
  //   if (response.statusCode != 200) return;
  //   Get.to(() => MenuScreen());
  // }
  Future<void> uploadFile(File file, String filename) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.2.101:8080/api/upload'),
    );

    // Tambahkan file ke permintaan multipart
    request.fields['filename'] = filename;
    request.files.add(
      await http.MultipartFile.fromPath('file', file.path),
    );

    // Kirim permintaan ke API Laravel
    var response = await request.send();

    if (response.statusCode == 200) {
      print('File berhasil diunggah');
    } else {
      print('Terjadi kesalahan saat mengunggah file');
    }
  }
}
