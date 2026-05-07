sealed class DetailsResultApi<T> {}

class SuccessApi<T> extends DetailsResultApi<T> {
  final T? data;
  SuccessApi({this.data});
}

class ErrorApi<T> extends DetailsResultApi<T> {
  final String message;
  ErrorApi(this.message);
}
