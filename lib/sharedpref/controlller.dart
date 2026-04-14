import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homep.dart';

// class UserController extends GetxController {
//   var name = ''.obs;
//   var email = ''.obs;
//   var isLoading = false.obs;
//   Future<void> loadUser() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     name.value = prefs.getString('name') ?? '';
//     email.value = prefs.getString('email') ?? '';
//   }
//
//   Future<void> saveUser(String name, String email) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('name', name);
//     await prefs.setString('email', email);
//   }
//
//   void setUser(String n, String e) {
//     name.value = n;
//     email.value = e;
//   }
//
//   Future<void> signUp(String n, String e, String password) async {
//     try {
//       isLoading.value = true;
//
//       await saveUser(n, e); // 👉 save in sharedpref
//       setUser(n, e);
//
//       Get.off(() => Homep());
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
class UserController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var isLoading = false.obs   ;

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
  }

  Future<void> saveUser(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  void setUser(String n, String e) {
    name.value = n;
    email.value = e;
  }

  Future<void> signUp(String n , String e , String password)async{
    try{
      isLoading.value = true;
      await saveUser(n, e);
      setUser(n, e);
      Get.to(()=> Homep());
    }catch(e){
      print(e);
    }finally{
      isLoading.value = false;
    }
  }
}
