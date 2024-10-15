class DeleteTodoRequestModel {
  final int id;

  const DeleteTodoRequestModel({required this.id});

  Map<String, dynamic> toJson() => {'id': id};
}
