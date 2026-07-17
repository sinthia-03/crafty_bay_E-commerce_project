import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/sign_in_params.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  bool _signInProgress = false;

  bool get SignInProgress => _signInProgress;
  String? _errorMessage;

  String? get errorMeaasge => _errorMessage;

  Future<bool> signIn(SignInParams params) async {
    bool isSuccess = false;

    _signInProgress =  true;
    notifyListeners(); // rebuild kore

    final NetworkResponse response = await getNetworkcaller().postRequest(
      Urls.signInUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      // TODO: save user token and user data into shared proference
    } else {
      _errorMessage = response.errorMessage;
    }
    _signInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
