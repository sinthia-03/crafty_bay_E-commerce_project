import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  static  MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings){
    Widget widget = SizedBox();

    switch (settings.name){
      case SplashScreen.name:
      widget = SplashScreen();
      break;
    }
    return MaterialPageRoute(builder: (ctx)=>widget);
  }
}