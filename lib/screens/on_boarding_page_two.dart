import 'package:chargemode/screens/login.dart';
import 'package:chargemode/screens/on_boarding_page_three.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageTwo extends StatelessWidget {
  const OnBoardingPageTwo({Key? key}) : super(key: key);

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
                  'Easy EV Navigation',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text('Travel Route',
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'For Electrics',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColor.primaryColor),
                ),
                Image.asset('assets/images/nearby_light.png'),
                SizedBox(
                  height: 50.h,
                ),
                Text('Grab The Best In Class',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('Digital Experience Crafted For',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('EV Drivers',
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(
                  height: 30.h,
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
                              width: index == 1 ? 15.0 : 10.0,
                              height: index == 1 ? 15.0 : 10.0,
                              decoration: BoxDecoration(
                                color: index == 1
                                    ? AppColor.primaryColorDark_l
                                    : AppColor.focusColor_l,
                                shape: BoxShape.circle,
                              ),
                            )),
                    SizedBox(
                      width: 30.h,
                    ), // Add some space between the buttons
                    FloatingActionButton(
                      backgroundColor: AppColor.primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OnBoardingPageThree()), // Replace AnotherPage() with your next page
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
