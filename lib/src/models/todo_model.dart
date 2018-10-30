class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  

  TodoModel.fromJson(Map<String, dynamic> parsedJson)
      : userId = parsedJson['userId'],
        id = parsedJson['id'],
        title = parsedJson['title'],
        completed = parsedJson['completed'] ?? false;
}
