class HttpExecption implements Exception {
  final String message;

  HttpExecption(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); //Instance of HttpException
  }
}