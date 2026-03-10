import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_flutter/controllers/task_controller.dart';

import 'drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TaskController controller = Get.put(TaskController());
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "app Bar Home ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue),
      drawer: DrawerScreen(),
      body: Obx(() {
        return ListView.builder(
            itemCount: controller.taskList.length,
            itemBuilder: (context, index) {
              final task = controller.taskList[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null),
                ),
                leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      controller.toggleTask(task);
                    }),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// EDIT BUTTON
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {

                        TextEditingController editController =
                        TextEditingController(text: task.title);

                        Get.defaultDialog(
                          title: "Edit Task",
                          content: TextField(
                            controller: editController,
                            decoration: InputDecoration(
                              hintText: "Update task",
                            ),
                          ),
                          textConfirm: "Update",
                          onConfirm: () {
                            controller.editTask(task.id, editController.text);
                            Get.back();
                          },
                        );
                      },
                    ),

                    /// DELETE BUTTON
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        controller.deleteTask(task.id);
                      },
                    ),
                  ],
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.defaultDialog(
            title: "add task",
            content: TextField(
              controller: taskController,
              decoration: InputDecoration(hintText: "Enter text"),
            ),
            textConfirm: "add",
            onConfirm: () {
              controller.addTasks(taskController.text);
              taskController.clear();
              Get.back();
            });
      }),
    );
  }
}
