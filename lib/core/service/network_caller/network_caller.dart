import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_response.dart';

class NetworkCaller {
  final Logger _logger = Logger();


  late final Map<String, String> Function() headers; // method return type dite hobe

  NetworkCaller({required this.headers});

  //get
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, headers: headers());
      //url pass
      final Response response = await get(uri, headers: headers());

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
          errorMessage: decodedJson['msg'] ?? 'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: true,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url, {
    Map<String, dynamic>? requestBody,
    Map<String, String>? headers,
  }) {
    _logger.d('''URL=> $url
 Headers=> $headers
 RequestBody=>$requestBody''');
  }

  void _logResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      _logger.i('''URL=> ${response.request?.url}
 Status Code=> ${response.statusCode}
 RequestBody=>${response.body}''');
    } else {
      _logger.e('''URL=> ${response.request?.url}
 Status Code=> ${response.statusCode}
 RequestBody=>${response.body}''');
    }
  }

  ////////////////////////////POST Method

  Future<NetworkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, requestBody: body, headers: headers());
      //url pass
      final Response response = await post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      _logResponse(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
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
          errorMessage: decodedJson['msg'] ?? 'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}


