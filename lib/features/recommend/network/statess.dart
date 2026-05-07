sealed class RecommendedResultApi<T> {}

class SuccesApi<T> extends RecommendedResultApi<T> {
  final T? data;
  SuccesApi({this.data});
}

class ErrorApi<T> extends RecommendedResultApi<T> {
  final String message;
  ErrorApi(this.message);
}
