import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static  const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Spacer(),
          Center(child: AppLogo()),
          Spacer(),
          Column(
            children: [
              CircularProgressIndicator(),
              Text('version 1.0.0')
            ],
          ),
          const SizedBox(height: 16,)
        ],
      )

    );
  }
}



