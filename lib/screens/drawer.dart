import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authcontroller.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [

          /// HEADER
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),

          /// LOGOUT
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              authController.logout();
            },
          ),



        ],
      ),
    );
  }
}