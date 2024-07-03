class Success {
  Success({
    this.code,
    this.response,
    this.status,
  });
  int? code;
  bool? status;
  Object? response;
}

class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}
