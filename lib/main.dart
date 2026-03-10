import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_flutter/screens/homepage.dart';
import 'package:todo_flutter/screens/login.dart';
import 'package:todo_flutter/screens/signup.dart';

import 'controllers/authcontroller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  User? user = FirebaseAuth.instance.currentUser;

  runApp(MyApp(user: user));}

class MyApp extends StatelessWidget {

  final User? user;

  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: user == null ? "/signup" : "/home",

      getPages: [

        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/login", page: () => Login()),
        GetPage(name: "/home", page: () => HomePage()),

      ],

    );

  }
}