import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger _logger = Logger(

  );
  Future<NetworkResponse> getRequest(String url) async {
    Uri uri = Uri.parse(url);

    _logRequest(url);
    //url pass
    final Response response = await get(uri);

    _logResponse(response);

    if (response.statusCode == 200) {
      //succees
      final decodedJson = jsonDecode(response.body); // encoded to decode kora
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        body: decodedJson,
      );
    } else {
      //failed{
      //'Something went wrong!',
    //}
      final decodedJson = jsonDecode(response.body);
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        errorMessage: decodedJson['message'] ?? 'Something went wrong!',
      );
    }
  }

  void _logRequest(String url,{Map<String, dynamic>? requestBody, Map<String, String>? headers}){
 _logger.d('''URL=> $url
 Headers=> $headers
 RequestBody=>$requestBody''');
  }

  void _logResponse(Response response){
    if(response.statusCode == 200 || response.statusCode == 201) {
      _logger.i('''URL=> ${response.request?.url}
 Status Code=> ${response.statusCode}
 RequestBody=>${response.body}''');
    }else{
      _logger.e('''URL=> ${response.request?.url}
 Status Code=> ${response.statusCode}
 RequestBody=>${response.body}''');
    }

  }

}



class NetworkResponse {  // custom object
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
}
