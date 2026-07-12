import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_parame.dart';
import 'package:flutter/cupertino.dart';

class SignUpProviders extends ChangeNotifier {
  bool _signUpInInProgress = false;

  bool get SignUpInInProgress => _signUpInInProgress;

  String? _errorMessage;
  String? get errorMeaasge => _errorMessage;

  Future<bool> signUp(SignUpParame params) async {
    bool isSuccess = false;
    _signUpInInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkcaller().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _signUpInInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
