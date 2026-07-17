import 'package:crafty_bay/app/extension/localization_extension.dart';
import 'package:crafty_bay/features/auth/data/models/sign_in_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sign_in_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/shared/presentation/screens/main_navi_holder_screen.dart';
import 'package:crafty_bay/features/shared/presentation/utlitis/validators.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //local scope
  final SignInProvider _signInProvider = SignInProvider();

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
                    const SizedBox(height: 80),
                    AppLogo(width: 100),
                    const SizedBox(height: 16),
                    Text('Welcome Back', style: textTheme.titleLarge),
                    Text(
                      'Sign in with your email and password',
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
                      controller: _passwordTEController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: context.localization.password,
                        hintText: context.localization.password,
                      ),
                      validator: (input)=> Validators.validatePassword(input)
                    ),
                    SizedBox(height: 8),
                    Consumer<SignInProvider>(
                      builder: (context,_,_) {
                        if(_signInProvider.SignInProgress){
                          return CircularProgressIndicator();
                        }
                        return FilledButton(
                          onPressed: _onTapSignInButton,
                          child: Text('Sign in'),
                        );
                      }
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: _onTapSignInButton,
                      child: Text('Dont have an account? Sign up'),
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
    Navigator.pushNamed(context, SignUpScreen.name);
    _signIn();
  }
// apicall
  Future<void>_signIn()async{
    SignInParams params = SignInParams(email: _emailTEController.text.trim(),
        password: _passwordTEController.text.trim()
    );
final isSuccess = await _signInProvider.signIn(params);
if(mounted == false){
  return;}
if(isSuccess){
  Navigator.pushNamedAndRemoveUntil(context, MainNaviHolderScreen.name, (predicate)=>false);
}else{
  showSnackBarMessage(context, _signInProvider.errorMeaasge!);
}
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordTEController.dispose();
    _emailTEController.dispose();
  }
}
