class CreateTodoRequestModel {
  final String title;
  final bool isCompleted;
  final int userId;

  const CreateTodoRequestModel(
      {required this.title, required this.isCompleted, required this.userId});

  Map<String, dynamic> toJson() =>
      {'todo': title, 'completed': isCompleted, 'userId': userId};
}
