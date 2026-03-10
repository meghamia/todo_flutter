import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/authcontroller.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final AuthController authController = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
        centerTitle: true,        backgroundColor: Colors.blue
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: Form(
              key: formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  /// TITLE
                  const Text(
                    "Create an Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// EMAIL
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

                  /// PASSWORD
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

                      if (value.length < 6) {
                        return "Password must be 6 characters";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  /// SIGNUP BUTTON
                  Obx(() {
                    return authController.isLoading.value
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,

                            child: ElevatedButton(
                              onPressed: () {

                                if (formKey.currentState!.validate()) {

                                  authController.signUp(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );

                                }

                              },

                              child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueAccent   )             ),
                           ),
                          );
                  }),

                  const SizedBox(height: 20),

                  /// LOGIN TEXT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text("Already have an account? "),

                      GestureDetector(
                        onTap: () {

                          /// navigate to login page
                          Get.toNamed("/login");

                        },

                        child: const Text(
                          "Login",
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