import 'dart:convert';

import 'package:todo_flutter/apis/model.dart';
import 'package:http/http.dart' as http;
// class ApiService {
//   static Future<List<MyPostModel>> fetchProducts() async {
//     final response =
//         await http.get(Uri.parse("https://dummyjson.com/products"));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       final List products = data['products'];
//       return products.map((e)=> MyPostModel.fromJson(e)).toList();
//
//     }else{
//       throw Exception("failed to load products");
//     }
//   }
// }
class ApiService{
  static Future<List<MyPostModel>> fetchProducts() async{
    final response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if(response.statusCode == 200){
      final Map<String,dynamic> data = json.decode(response.body);
      final List products = data['products'];
      return products.map((e)=> MyPostModel.fromJson(e)).toList();
    }else{
      throw Exception("failed loading");
    }
  }
}