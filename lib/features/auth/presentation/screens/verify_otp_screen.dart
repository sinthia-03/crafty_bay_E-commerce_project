import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extension/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/auth/presentation/providers/otp_timer_provider.dart';
import 'package:crafty_bay/features/shared/presentation/utlitis/validators.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verifyOtpScreen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _otpTimerProvider.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return ChangeNotifierProvider.value(
      value: _otpTimerProvider,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const .all(24),
              child: Center(
                child: Form(
                  key: _formkey,
                  autovalidateMode: .onUserInteraction,
                  onChanged: () {},
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      AppLogo(width: 100),
                      const SizedBox(height: 16),
                      Text('Verify Your OTP', style: textTheme.titleLarge),
                      Text(
                        'Enter your otp that has been sent to your email address',
                        style: textTheme.labelLarge,
                      ),
                      const SizedBox(height: 24),

                      MaterialPinField(
                        length: 4,
                        pinController: _otpTEController,
                        keyboardType: .number,
                        theme: MaterialPinTheme(
                          fillColor: Colors.transparent,
                          focusedFillColor: Colors.transparent,
                          focusedBorderColor: AppColors.themeColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      FilledButton(
                        onPressed: _onTapSignInButton,
                        child: Text('Verify'),
                      ),
                      const SizedBox(height: 16),
                      Consumer<OtpTimerProvider>(
                        builder: (context, _, _) {
                          if (_otpTimerProvider.secondsLeft == 0) {
                            return TextButton(
                              onPressed: _onTapResendOTP,
                              child: Text('Resend OTP'),
                            );
                          } else {
                            return RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(text: 'Resend OTP after '),
                                  TextSpan(
                                    text: '${_otpTimerProvider.secondsLeft}s',
                                    style: TextStyle(
                                      color: AppColors.themeColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
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
    if (_formkey.currentState!.validate()) {
      //call sign in api
    }
  }

  void _onTapResendOTP() {
    _otpTimerProvider.startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpTEController.dispose();
  }
}
