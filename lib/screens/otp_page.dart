import 'package:chargemode/controller/auth_controller.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key, required this.phone});

  final String phone;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();
  OtpTimerButtonController controller = OtpTimerButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title:
            Text("Verification", style: Theme.of(context).textTheme.bodyMedium),
        backgroundColor: Colors.white,
        // title: Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'We’ve send you the verification',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'code on +91 ${widget.phone}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 20.h,
              ),
              PinCodeTextField(
                controller: otpController,
                keyboardType: TextInputType.number,

                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor: Colors.white,
                  inactiveColor: AppColor.focusColor_l,
                ),
                animationDuration: Duration(milliseconds: 300),
                // controller: textEditingController,
                onChanged: (value) {
                  print(value);
                },
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // Adjust this property to change the space between the fields
              ),
              Consumer<AuthController>(builder: (context, provider, child) {
                return provider.resendTime
                    ? Center(
                        child: OtpTimerButton(
                          controller: controller,
                          onPressed: () {},
                          buttonType: ButtonType.text_button,
                          text: Text('Re-send code in-',
                              style: Theme.of(context).textTheme.bodyMedium),
                          duration: 20,
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          context
                              .read<AuthController>()
                              .resendOtp(widget.phone, context);
                        },
                        child: Text(
                          'Resend OTP',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                      );
              }),
              SizedBox(
                height: 350.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthController>().otpVerification(
                          widget.phone, otpController.text, context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Consumer<AuthController>(
                        builder: (context, provider, child) {
                      return provider.loading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'CONTINUE',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      color: AppColor.primaryColorLight_l),
                            );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
