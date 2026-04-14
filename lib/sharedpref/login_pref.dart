import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_flutter/sharedpref/homep.dart';
import 'package:todo_flutter/sharedpref/sign_up.dart';

import 'controlller.dart';

class LoginSharedpref extends StatelessWidget {
  LoginSharedpref({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                "Enter yours creadentials",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
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
                  onPressed: () async {
                    await user.saveUser(
                      "User",
                      emailController.text,
                    );

                    user.setUser("User", emailController.text);

                    Get.off(() => Homep());
                  },
                    child: Text(
                      "Login ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    )),
              ),
              Row(
                children: [
                  Text("don't have an account?"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpSharedpref()));
                      },
                      child: Text("Signup"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
