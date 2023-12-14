import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.primaryColorLight_l,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColorDark_l),
        bodyLarge: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColorDark_l), //Charge your EV
        bodyMedium: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.black_l), //Scan Charge and Go
        bodySmall: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.focusColor_l) //Connecting to chargeMOD
        ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.primaryColorLight_d,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 40.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColorDark_d), //At Your
        bodyLarge: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColorDark_d), //Charge your EV
        bodyMedium: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.primaryColorDark_d), //Scan Charge and Go
        bodySmall: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.focusColor_d) //Connecting to chargeMOD
        ),
  );
}
