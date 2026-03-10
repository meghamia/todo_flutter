import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../screens/homepage.dart';

import 'package:flutter/material.dart';


class AuthController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  /// SIGNUP
  Future signUp(String email, String password) async {

    /// EMAIL VALIDATION
    if (!GetUtils.isEmail(email)) {
      Get.snackbar(
        "Invalid Email",
        "Please enter a valid email",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    /// PASSWORD VALIDATION
    if (password.length < 8) {
      Get.snackbar(
        "Weak Password",
        "Password must be at least 8 characters",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {

      isLoading.value = true;

      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      /// NAVIGATE TO HOME
      Get.offAll(() => HomePage());

    }

    on FirebaseAuthException catch (e) {

      if (e.code == "email-already-in-use") {

        Get.snackbar(
          "Signup Error",
          "This email is already registered",
        );

      }

      else if (e.code == "invalid-email") {

        Get.snackbar(
          "Signup Error",
          "Invalid email format",
        );

      }

      else if (e.code == "weak-password") {

        Get.snackbar(
          "Signup Error",
          "Password is too weak",
        );

      }

      else {

        Get.snackbar(
          "Signup Error",
          e.message ?? "Something went wrong",
        );

      }

    }

    finally {

      isLoading.value = false;

    }

  }


  /// LOGIN
  Future login(String email, String password) async {

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Enter valid email");
      return;
    }

    if (password.isEmpty) {
      Get.snackbar("Error", "Enter password");
      return;
    }

    try {

      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        "Success",
        "Login successful",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      /// GO TO HOME
      Get.offAll(() =>  HomePage());

    }

    on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {

        Get.snackbar(
          "Login Error",
          "No account found with this email",
        );

      }

      else if (e.code == 'wrong-password') {

        Get.snackbar(
          "Login Error",
          "Incorrect password",
        );

      }

      else if (e.code == 'invalid-email') {

        Get.snackbar(
          "Login Error",
          "Invalid email format",
        );

      }

      else {

        Get.snackbar(
          "Login Error",
          e.message ?? "Login failed",
        );

      }

    }

    finally {

      isLoading.value = false;

    }

  }


  /// LOGOUT

  Future logout() async {

    await _auth.signOut();

    Get.snackbar(
      "Logout",
      "You have logged out",
    );

    Get.offAllNamed("/login");

  }



}