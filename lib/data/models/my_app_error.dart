class MyAppError implements Exception {
  final String message;

  MyAppError(this.message);

  @override
  String toString() => message;
}
