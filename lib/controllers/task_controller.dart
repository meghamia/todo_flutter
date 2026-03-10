import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_flutter/models/task_model.dart';

import '../models/task_model.dart';

class TaskController extends GetxController {

  var taskList = <TaskModel>[].obs;

  String baseUrl =
      "https://todoapp-378e7-default-rtdb.firebaseio.com/tasks";

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }

  /// FETCH TASKS
  Future fetchTasks() async {

    final url = Uri.parse("$baseUrl.json");

    final response = await http.get(url);

    if (response.statusCode == 200) {

      if (response.body == "null") {
        taskList.clear();
        return;
      }

      final data = jsonDecode(response.body);

      taskList.clear();

      data.forEach((id, task) {
        taskList.add(TaskModel.fromJson(id, task));
      });
    }
  }

  /// ADD TASK
  Future addTasks(String title) async {

    final url = Uri.parse("$baseUrl.json");

    await http.post(
      url,
      body: jsonEncode({
        "title": title,
        "isCompleted": false,
      }),
    );

    fetchTasks();
  }

  /// DELETE TASK
  Future deleteTask(String id) async {

    final url = Uri.parse("$baseUrl/$id.json");

    await http.delete(url);

    /// remove from UI instantly
    taskList.removeWhere((task) => task.id == id);

    fetchTasks();
  }

  /// TOGGLE TASK
  Future toggleTask(TaskModel task) async {

    final url = Uri.parse("$baseUrl/${task.id}.json");

    await http.patch(
      url,
      body: jsonEncode({
        "isCompleted": !task.isCompleted
      }),
    );

    fetchTasks();
  }



  Future editTask(String id, String newTitle) async {

    final url = Uri.parse("$baseUrl/$id.json");

    await http.patch(
      url,
      body: jsonEncode({
        "title": newTitle,
      }),
    );

    fetchTasks();
  }
}