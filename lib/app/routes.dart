import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/products/presentation/screen/product_details_screen.dart';
import 'package:crafty_bay/features/products/presentation/screen/product_list_by_categoryScreen.dart';
import 'package:crafty_bay/features/shared/presentation/screens/main_navi_holder_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static  MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings){
    Widget widget = SizedBox();

    switch (settings.name){
      case SplashScreen.name:
      widget = SplashScreen();
      break;

      case SignInScreen.name:
        widget = SignInScreen();

      case SignUpScreen.name:
        widget = SignUpScreen();
      case VerifyOtpScreen.name:
        final email = settings.arguments as String;
        widget = VerifyOtpScreen(email: email);
      case MainNaviHolderScreen.name:
        widget = MainNaviHolderScreen();
      case ProductListByCategoryscreen.name:
        Map<String, dynamic> args = settings.arguments as Map<String,dynamic>;

        widget = ProductListByCategoryscreen( // categoryscreen
          catrgotriId: args['categoryId'],
          categoryName: args['categoryName'],
        );

      case ProductDetailsScreen.name:
        final String productId = settings.arguments as String ;
        widget = ProductDetailsScreen(productId:productId );

    }
    return MaterialPageRoute(builder: (ctx)=>widget);
  }
}