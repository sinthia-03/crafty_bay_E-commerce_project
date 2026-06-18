import 'package:crafty_bay/app/extension/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shared/presentation/utlitis/validators.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController _phoneNumberTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const .all(24),
            child: Center(
              child: Form(
                key: _formkey,
                autovalidateMode: .onUserInteraction,
                onChanged: (){},
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
                        validator: (String? value)=> Validators.validateEmail(value)
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNamelTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.firstName,
                          hintText: context.localization.firstName,
                        ),
                      validator: (String? value) =>
                      Validators.validateInput(value,'Enter Your first name'),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _lastNameTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.lastName,
                          hintText: context.localization.lastName,
                        ),
                      validator: (String? value) =>
                          Validators.validateInput(value,'Enter Your last name'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.city,
                          hintText: context.localization.city,
                        ),
                      validator: (String? value) =>
                          Validators.validateInput(value,'Enter Your city'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneNumberTEController,
                      decoration: InputDecoration(
                        labelText: context.localization.phoneNumber,
                        hintText: context.localization.phoneNumber,
                      ),
                      validator: (String? value) =>
                          Validators.validateInput(value,'Enter Your phone number'),
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                        decoration: InputDecoration(
                          labelText: context.localization.password,
                          hintText: context.localization.password,
                        ),
                        validator: (input)=> Validators.validatePassword(input)
                    ),
                    SizedBox(height: 8),
                    FilledButton(
                      onPressed: _onTapSignUpButton,
                      child: Text('Sign Up'),
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
    );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapSignUpButton() {
if(_formkey.currentState!.validate()){
  //TODO: sign in api
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
