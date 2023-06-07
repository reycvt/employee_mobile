import 'package:flutter/cupertino.dart';
import 'package:employee_mobile/pages/loginScreen.dart';
import 'package:employee_mobile/pages/homeScreen.dart';
import 'package:employee_mobile/pages/encryptScreen.dart';
import 'package:employee_mobile/pages/decryptScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    EncryptScreen(),
    HomeScreen(),
    DecryptScreen()
  ];

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_rounded,
            ),
            label: "Encrypt",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_sharp),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_open),
            label: 'Decrypt',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
