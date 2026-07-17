import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_params.dart';
import 'package:crafty_bay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:crafty_bay/features/auth/presentation/providers/otp_timer_provider.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/center_progress_indicator.dart';
import 'package:crafty_bay/features/shared/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {

  const VerifyOtpScreen({super.key,required this.email});

  static const String name = '/verifyOtpScreen';

  final String email;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final PinInputController _otpTEController = PinInputController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final OtpTimerProvider _otpTimerProvider = OtpTimerProvider();
final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      _otpTimerProvider.startTimer();

  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: _verifyOtpProvider,
        ),
        ChangeNotifierProvider.value(value: _otpTimerProvider),
      ],
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
                        SizedBox(height: 16),
                        Consumer<VerifyOtpProvider>(
                          builder: (context,_,_) {
                            if(_verifyOtpProvider.VerifyOtpInProgress){
                              return CenterProgressindicator();
                            }
                            return FilledButton(
                              onPressed: _onTapVerifyOtpButton,
                              child: Text('Verify'),
                            );
                          }
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

  void _onTapVerifyOtpButton() {
    if (_formkey.currentState!.validate()) {
      //call sign in api
    }
  }


  Future<void> _verifyOtp()async{
    final bool isSuccess = await _verifyOtpProvider.verifyOtp(
      VerifyOtpParams(otp: _otpTEController.text,email: ''),

    );
    if(isSuccess){
      //navi to next screen
    }
    else{
      showSnackBarMessage(context, _verifyOtpProvider.errorMeaasge!);
    }
  }

  void _onTapResendOTP() {
    _otpTimerProvider.startTimer();
    //TODO: resend otp from api
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _otpTEController.dispose();
  }
}
