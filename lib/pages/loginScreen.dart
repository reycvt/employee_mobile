import 'package:employee_mobile/api/auth_controller.dart';
import 'package:employee_mobile/pages/homeScreen.dart';
import 'package:employee_mobile/pages/menuScreen.dart';
import 'package:employee_mobile/utils/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authC = Get.put(AuthController());
  bool isPassword = true;
  TextEditingController userC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  FocusNode userMode = FocusNode();
  FocusNode passwordMode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: userC,
                focusNode: userMode,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 236, 236),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  labelText: "Email",
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                controller: passwordC,
                focusNode: passwordMode,
                obscureText: isPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 236, 236, 236),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  labelText: "Password",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(isPassword
                          ? Icons.visibility
                          : Icons.visibility_off)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (userC.text.isEmpty && passwordC.text.isEmpty) {
                        print("Isi data");
                      } else {
                        print("Data terisi");
                        print(userC.text);
                        print(passwordC.text);
                        await authC.login(userC.text, passwordC.text);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const MenuScreen()),
                        // );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                    child: const Text("Login")),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
