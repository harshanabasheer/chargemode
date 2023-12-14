import 'package:chargemode/controller/auth_controller.dart';
import 'package:chargemode/screens/otp_page.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                'ChargeMOD',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text('Let’s Start',
                  style: Theme.of(context).textTheme.titleLarge),
              Text(
                'From login',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColor.primaryColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    // Dropdown icon with Indian flag
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Colors.grey), // Add border styling as needed
                      ),
                      child: Image.asset(
                        'assets/images/flag.png',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'Enter Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors
                                    .grey), // Add border styling as needed
                          ),
                          prefixIcon: Icon(Icons.phone),
                          // Add any other styling or configuration you need
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<AuthController>()
                            .sendOtp(_phoneController.text, context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.primaryColor,
                      ),
                      child: Consumer<AuthController>(
                          builder: (context, provider, child) {
                        return provider.loading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Send OTP',
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
              ),
              SizedBox(
                height: 330.h,
              ),
              Text(
                'By Continuing you agree to our',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Terms & Condition and Privacy Policy',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColor.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
