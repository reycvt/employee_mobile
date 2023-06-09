import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:employee_mobile/pages/loginScreen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DecryptScreen extends StatefulWidget {
  const DecryptScreen({super.key});

  @override
  State<DecryptScreen> createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            color: Colors.green,
          ),
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Settings",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Dashboard",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        NetworkImage("https://picsum.photos/250?image=9"),
                  ),
                ),
                const Text(
                  "Adikanna",
                  style: TextStyle(fontSize: 30),
                ),
                const Text(
                  "SuperAdmin",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 360,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(55),
                    //     topRight: Radius.circular(55)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 320,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(40, 177, 177, 177),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55)),
                  ),
                ),
              ),
            ],
          )
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 320,
          //     decoration: const BoxDecoration(
          //       color: Color.fromARGB(40, 177, 177, 177),
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(55),
          //           topRight: Radius.circular(55)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
