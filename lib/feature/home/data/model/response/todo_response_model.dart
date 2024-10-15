class TodoListModel {
  final List<TodoResponseModel> todos;
  final int? total;
  final int? skip;
  final int? limit;

  const TodoListModel({required this.todos, this.total, this.skip, this.limit});

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
      todos: List<TodoResponseModel>.from(
          json['todos'].map((x) => TodoResponseModel.fromJson(x))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit']);

  Map<String, dynamic> toJson() => {
        'todos': List<dynamic>.from(todos.map((x) => x.toJson())),
        'total': total,
        'skip': skip,
        'limit': limit
      };
}

class TodoResponseModel {
  final int id;
  final String title;
  final bool isCompleted;
  final int userId;

  const TodoResponseModel(
      {required this.id,
      required this.title,
      required this.isCompleted,
      required this.userId});

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) =>
      TodoResponseModel(
          id: json['id'],
          title: json['todo'],
          isCompleted: json['completed'],
          userId: json['userId']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'todo': title, 'completed': isCompleted, 'userId': userId};

  TodoResponseModel copyWith({
    int? id,
    String? title,
    bool? isCompleted,
    int? userId,
  }) =>
      TodoResponseModel(
          id: id ?? this.id,
          title: title ?? this.title,
          isCompleted: isCompleted ?? this.isCompleted,
          userId: userId ?? this.userId);
}
