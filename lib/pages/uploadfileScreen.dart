import 'dart:io';

import 'package:employee_mobile/pages/encryptScreen.dart';
import 'package:flutter/material.dart';
import 'package:employee_mobile/pages/menuScreen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:file_picker/file_picker.dart';
import 'package:employee_mobile/widget/buttonWidget.dart';
import 'package:get/get.dart';

import '../api/pdfApi.dart';
import '../api/upload_controller.dart';

class ImportfileScreen extends StatefulWidget {
  const ImportfileScreen({super.key});

  @override
  State<ImportfileScreen> createState() => _ImportfileScreenState();
}

class _ImportfileScreenState extends State<ImportfileScreen> {
  final uploadC = Get.put(UploadController());
  late File file;
  TextEditingController filenameC = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuScreen()),
                          ),
                          child: const Text(
                            "Back",
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.12,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.01),
                          child: const Text(
                            "Upload File",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                color: Color.fromARGB(83, 219, 219, 219),
                width: 360,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ButtonWidget(
                    icon: Icons.drive_folder_upload_outlined,
                    onClicked: () async {
                      file = await PDFApi.pickFile();
                      print(file);
                      if (file == null) return;
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Support PDF",
                  style: TextStyle(color: Color.fromARGB(255, 177, 177, 177)),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: filenameC,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 236, 236),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  labelText: "Name File",
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
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
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: isPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 236, 236, 236),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255))),
                  labelText: "Confirm Password",
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
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                                'Apakah Sudah Yakin Untuk Proses Data'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await uploadC.uploadFile(
                                      file, filenameC.text);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MenuScreen()));
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                    child: const Text("Process")),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
