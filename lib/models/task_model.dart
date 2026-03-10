class TaskModel {

  String id;
  String title;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TaskModel.fromJson(String id, Map data) {
    return TaskModel(
      id: id,
      title: data['title'] ?? '',
      isCompleted: data['isCompleted'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {

    return {
      "title": title,
      "isCompleted": isCompleted,
    };

  }

}