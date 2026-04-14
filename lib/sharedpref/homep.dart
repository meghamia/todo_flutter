import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controlller.dart';
class Homep extends StatelessWidget {
  const Homep({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${user.name.value}"),
            Text("Email: ${user.email.value}"),
          ],
        )),
      ),
    );
  }
}