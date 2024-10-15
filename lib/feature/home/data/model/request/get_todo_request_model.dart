class GetTodoRequestModel {
  final int limit;
  final int skip;

  const GetTodoRequestModel({required this.limit, required this.skip});

  Map<String, dynamic> toJson() => {'limit': limit, 'skip': skip};
}
