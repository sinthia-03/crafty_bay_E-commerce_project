part of 'network_caller.dart';

class NetworkResponse {
  //custom class
  final bool isSuccess;

  final int statusCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMessage,
  });

  /// Uses
  // NetworkResponse response = await getNetworkCaller().getRequest('url');
  // if (response.isSuccess) {
  //
  // } else {
  // response.errorMessage!
  // }
}
