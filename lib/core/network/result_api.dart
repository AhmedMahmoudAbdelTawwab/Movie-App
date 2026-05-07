sealed class ResultApi<T> {
  const ResultApi();
}

class Success<T> extends ResultApi<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ResultApi<T> {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});
}
