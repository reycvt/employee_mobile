import 'package:employee_mobile/api/update_controller.dart';
import 'package:employee_mobile/pages/homeScreen.dart';
import 'package:employee_mobile/pages/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update User'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                updateUser(
                  nameController.text,
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }

  void getUser() async {
    // Panggil fungsi untuk mendapatkan data pengguna dari API
    // dan kemudian set nilai awal pada form
    var user = await getUserData();

    setState(() {
      nameController.text = user?['name'];
      emailController.text = user?['email'];
    });
  }
}
