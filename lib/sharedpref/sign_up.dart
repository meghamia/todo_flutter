import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controlller.dart';
import 'login_pref.dart';

class SignUpSharedpref extends StatelessWidget {
  SignUpSharedpref({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App bar"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(23.4),
          child: Container(
            padding: EdgeInsets.all(23),
            child: Column(
              children: <Widget>[
                Text(
                  "SignUp",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                Text("Create an account",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    prefixIcon: Icon(Icons.person_3_outlined),
                    fillColor: Colors.grey,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.zero,
                    ),
                    prefixIcon: Icon(Icons.mail_outlined),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.password),
                    fillColor: Colors.grey,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        user.signUp(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: Text(
                        "signup",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                ),
                Row(
                  children: [
                    Text(
                      "already have an account?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginSharedpref()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
