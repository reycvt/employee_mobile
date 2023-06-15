import 'package:employee_mobile/api/user_controller.dart';
import 'package:employee_mobile/model/data_user.dart';
import 'package:employee_mobile/pages/loginScreen.dart';
import 'package:employee_mobile/pages/profileScreen.dart';
import 'package:employee_mobile/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User_data> listData = [];
  Repository user_data = Repository();
  getData() async {
    listData = await user_data.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()),
                      ),
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
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   radius: 70,
                      //   backgroundColor: Color.fromARGB(255, 238, 238, 238),
                      // )
                    ],
                  ),
                  //  ListView.separated(itemBuilder: (context,index){
                  //     return Container(child: Text(listData[index].name),);
                  //   }, separatorBuilder: (context,index){

                  //   return  const Divider();
                  //   },
                  //    itemCount: listData.length),
                )
              ],
            ),
          ),
          // Container(
          //   child: ListView.separated(
          //       itemBuilder: (context, index) {
          //         return Container(child: Text(listData[index].name));
          //       },
          //       separatorBuilder: (context, index) {
          //         return Divider();
          //       },
          //       itemCount: listData.length),
          // )
        ],
      ),
    );
  }
}
