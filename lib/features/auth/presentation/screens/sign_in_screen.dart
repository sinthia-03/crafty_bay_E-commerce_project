import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            AppLogo(width: 100),
            Text('Welcome Back', style: textTheme.titleLarge),
            Text(
              'Sign in with your email and password',
              style: textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
