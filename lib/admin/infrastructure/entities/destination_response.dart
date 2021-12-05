class DestinationResponse<T> {
  DestinationResponse({
    required this.message,
    required this.isSuccess,
    required this.data,
  });
  final String message;
  final bool isSuccess;
  final T data;
}
