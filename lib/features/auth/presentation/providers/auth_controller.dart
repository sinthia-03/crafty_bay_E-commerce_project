import 'dart:convert';

import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {

  static final String _accessTokenkey = 'access-Token';
  static final String _userKey= 'user';

  static String? accessToken;
  static UserModel? user;

  static Future<void> saveUserData(String token, UserModel userModel)async{
SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
await sharedPreferences.setString(_accessTokenkey, token);
await sharedPreferences.setString(_userKey, jsonEncode(userModel.toJson()));

user = userModel;
accessToken = token;
  }
//
  static Future<void> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenkey);
    user = UserModel.fromJson(jsonDecode(sharedPreferences.getString(_userKey)!)
    );
  }
//login ace kina check korbe
  static Future<bool> isLoggedIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_accessTokenkey)!= null;

  }
  // user data clear use korbe
  static Future<void> clearuserdata()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_accessTokenkey);
    await sharedPreferences.remove(_userKey);
  }


}