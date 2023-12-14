import 'package:chargemode/screens/on_boarding_page_one.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    Timer.periodic(Duration(milliseconds: 20), (Timer t) {
      setState(() {
        progress += 0.01;
        if (progress >= 1) {
          t.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingPageOne()),
          );
        }
      });
    });
    return Future.delayed(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/chargeMOD.png"),
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Image.asset("assets/images/POWER TO PEOPLE.png"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: LinearProgressIndicator(
                  backgroundColor: AppColor.focusColor_d,
                  color: AppColor.primaryColor,
                  value: progress),
            ),
            Text('Connecting to ChargeMode',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
