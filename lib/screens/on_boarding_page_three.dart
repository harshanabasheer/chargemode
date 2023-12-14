import 'package:chargemode/screens/login.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageThree extends StatelessWidget {
  const OnBoardingPageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text('SKIP',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Interaction with Grid',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text('RealTime', style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Monitoring',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColor.primaryColor),
                ),
                SizedBox(
                  width: 280.w,
                  height: 280.h,
                  child: Image.asset('assets/images/charging.png'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text('Intelligent Sensible Devices',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('Ambicharge Series',
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(
                      width: 30.h,
                    ),
                    ...List.generate(
                        3,
                        (index) => Container(
                              margin: const EdgeInsets.all(4.0),
                              width: index == 2 ? 15.0 : 10.0,
                              height: index == 2 ? 15.0 : 10.0,
                              decoration: BoxDecoration(
                                color: index == 2
                                    ? AppColor.primaryColorDark_l
                                    : AppColor.focusColor_l,
                                shape: BoxShape.circle,
                              ),
                            )),
                    SizedBox(
                      width: 30.h,
                    ),
                    FloatingActionButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Icon(
                          Icons.arrow_forward_ios), // This is the ">" symbol
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
