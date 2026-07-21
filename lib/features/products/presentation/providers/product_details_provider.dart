import 'package:crafty_bay/app/get_network_caller.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/service/network_caller/network_caller.dart';
import 'package:crafty_bay/features/products/data/models/product_details_model.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsProvider extends ChangeNotifier{
bool _getProductDetailsInProgress = false;

String? _errormessage;
ProductDetailsModel? _productDetails;

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  String? get errorMessage=>_errormessage;
  ProductDetailsModel? get productDetails =>_productDetails;

  Future<bool> getproductDetails(String productId) async{
    bool isSuccess = false;

    _getProductDetailsInProgress = true;
    notifyListeners();

    final NetworkResponse response = await getNetworkcaller().getRequest(Urls.productDetailsUrl(productId),
    );
    if(response.isSuccess){
      _productDetails = ProductDetailsModel.fromJson(response.body['data']);
      isSuccess = true;
      _errormessage = null;

    }
    else{
      _errormessage = response.errorMessage;

    }
    _getProductDetailsInProgress = false;
    notifyListeners();
    return isSuccess;
  }
}