import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:flutter/cupertino.dart';

import '../../../cart/data/models/add_to_cart_params.dart';

class AddToCartProvider extends ChangeNotifier{
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading=> _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(AddToCartParams params)async{
    bool isSuccess = false;
    _isLoading = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkcaller().postRequest(Urls.addToCartUrl,body: params.toJson());
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
    }
    else{
      _errorMessage = response.errorMessage;
    }
    _isLoading = false;
    notifyListeners();
    return isSuccess;
  }

}