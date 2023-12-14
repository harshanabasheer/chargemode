import 'package:chargemode/controller/auth_controller.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({super.key, required this.phone});
  final String phone;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Update Profile',
            style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              _buildTextFieldWithLabel(
                  'First Name', 'First name', firstNameController),
              SizedBox(height: 20.h),
              _buildTextFieldWithLabel(
                  'Last Name', 'Last name', lastNameController),
              SizedBox(height: 20.h),
              _buildTextFieldWithLabel('Email', 'Email', emailController),
              SizedBox(height: 20.h),
              Text("Phone Number",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 20.h),
              Text(widget.phone, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 70.h),
              Align(
                  alignment: Alignment.center,
                  child: Text("Completing Your Profile",
                      style: Theme.of(context).textTheme.bodyMedium)),
              SizedBox(height: 10.h),
              Text(
                  "This action will reflect in your activities and payments after saving. we ask for email details for recieving monthly activity and notifications",
                  style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 10.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.primaryColor,
                ),
                onPressed: () {
                  context.read<AuthController>().register(
                      widget.phone,
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      context);
                },
                child: Consumer<AuthController>(
                    builder: (context, provider, child) {
                  return provider.loading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Save Changes',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColor.primaryColorLight_l),
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(
      String labelText, String hint_text, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint_text,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
