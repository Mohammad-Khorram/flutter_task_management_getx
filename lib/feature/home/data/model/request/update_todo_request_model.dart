class UpdateTodoRequestModel {
  final int id;
  final bool isCompleted;

  const UpdateTodoRequestModel({required this.id, required this.isCompleted});

  Map<String, dynamic> toJson() => {'completed': isCompleted};
}
