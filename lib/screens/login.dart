import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authcontroller.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final AuthController authController = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: Form(
              key: formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// TITLE
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// EMAIL FIELD
                  TextFormField(
                    controller: emailController,

                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.grey.shade300,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email";
                      }

                      if (!value.contains("@")) {
                        return "Enter valid email";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  /// PASSWORD FIELD
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.grey.shade300,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  /// LOGIN BUTTON
                  Obx(() {
                    return authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,

                      child: ElevatedButton(
                        onPressed: () {

                          if (formKey.currentState!.validate()) {

                            authController.login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );

                          }

                        },

                        child: const Text("Login"),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  /// SIGNUP TEXT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text("Don't have an account? "),

                      GestureDetector(
                        onTap: () {

                          Get.toNamed("/signup");

                        },

                        child: const Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}