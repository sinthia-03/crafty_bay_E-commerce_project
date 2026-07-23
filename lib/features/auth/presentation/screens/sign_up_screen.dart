import 'dart:math';

import 'package:crafty_bay/app/extension/localization_extension.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_parame.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_in_provider.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_up_providers.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shared/presentation/utlitis/validators.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widgets/center_progress_indicator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/SignUPScreen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNamelTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final SignUpProviders _signUpProviders = SignUpProviders();

  bool _enableButton = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider.value(
      value: _signUpProviders,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const .all(24),
              child: Center(
                child: Form(
                  key: _formkey,
                  autovalidateMode: .onUserInteraction,
                  onChanged: _checkIfFromValid,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      AppLogo(width: 80),
                      const SizedBox(height: 16),
                      Text('Create an Account', style: textTheme.titleLarge),
                      Text(
                        'Sign up with your email and password',
                        style: textTheme.labelLarge,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailTEController,
                        textInputAction: .next,
                        keyboardType: .emailAddress,
                        decoration: InputDecoration(
                          labelText: context.localization.email,
                          hintText: context.localization.email,
                        ),
                        validator: (String? value) =>
                            Validators.validateEmail(value),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _firstNamelTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.firstName,
                          hintText: context.localization.firstName,
                        ),
                        validator: (String? value) => Validators.validateInput(
                          value,
                          'Enter Your first name',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _lastNameTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.lastName,
                          hintText: context.localization.lastName,
                        ),
                        validator: (String? value) => Validators.validateInput(
                          value,
                          'Enter Your last name',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _cityTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.city,
                          hintText: context.localization.city,
                        ),
                        validator: (String? value) =>
                            Validators.validateInput(value, 'Enter Your city'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneNumberTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.phoneNumber,
                          hintText: context.localization.phoneNumber,
                        ),
                        validator: (String? value) => Validators.validateInput(
                          value,
                          'Enter Your phone number',
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.password,
                          hintText: context.localization.password,
                        ),
                        validator: (input) =>
                            Validators.validatePassword(input),
                      ),
                      SizedBox(height: 8),
                      Consumer<SignUpProviders>(
                        builder: (context, _, _) {
                          if (_signUpProviders.SignUpInInProgress) {
                            return CenterProgressindicator();
                          }
                          return FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: _enableButton == false
                                  ? Colors.grey
                                  : null,
                            ),
                            onPressed: _enableButton
                                ? _onTapSignUpButton
                                : null,
                            child: Text('Sign Up'),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _onTapSignInButton,
                        child: Text('Have an account? Sign In'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _checkIfFromValid() {
    if (_formkey.currentState!.validate()) {
      _enableButton = true;
    } else {
      _enableButton = false;
    }
    setState(() {});
  }

  void _onTapSignUpButton() {
    if (_formkey.currentState!.validate()) {
      _signUp();
    }
    //Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  Future<void> _signUp() async {
    SignUpParame params = SignUpParame(
      email: _emailTEController.text.trim(),
      firstName: _firstNamelTEController.text
          .trim(), // faka space falai doyar jonno trim use hoy
      lastName: _lastNameTEController.text.trim(),
      city: _cityTEController.text.trim(),
      phone: _phoneNumberTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signUpProviders.signUp(params);
    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOtpScreen.name,
      arguments: _emailTEController.text.trim());
    } else {
      showSnackBarMessage(context, _signUpProviders.errorMeaasge!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordTEController.dispose();
    _emailTEController.dispose();
    _firstNamelTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEController.dispose();
    _phoneNumberTEController.dispose();
  }
}
