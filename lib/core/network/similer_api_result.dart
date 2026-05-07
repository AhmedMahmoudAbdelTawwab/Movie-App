sealed class SimilarApiResultStates<T> {}

class SuccessSimilarApi<T> extends SimilarApiResultStates<T> {
  final T? data;
  SuccessSimilarApi({this.data});
}

class ErrorSimilarApi<T> extends SimilarApiResultStates<T> {
  final String message;
  ErrorSimilarApi(this.message);
}
