import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../shared/presentation/screens/main_navi_holder_screen.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextScreen();
  }

 Future <void> _navigateToNextScreen()async{
    await Future.delayed(Duration(seconds: 2));

    if(await AuthController.isLoggedIn()){
      await AuthController.getUserData();
    }
    Navigator.pushNamedAndRemoveUntil(context,
        MainNaviHolderScreen.name, (predicate)=> false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: AppLogo()),
          Spacer(),
          Column(
            children: [
              CircularProgressIndicator(),
              Text('${AppLocalizations.of(context)?.version} 1.0.0'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
