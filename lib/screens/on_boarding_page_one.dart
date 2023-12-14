import 'package:chargemode/screens/login.dart';
import 'package:chargemode/screens/on_boarding_page_two.dart';
import 'package:chargemode/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPageOne extends StatelessWidget {
  const OnBoardingPageOne({Key? key}) : super(key: key);

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
                child:
                    Text('SKIP', style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Charge your EV',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text('At Your', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'Fingertips',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColor.primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/vehicle.png',
                    fit: BoxFit.fitWidth,
                  )),
            ),
            SizedBox(
              height: 60.h,
            ),
            Text('Scan Charge and Go',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('Effortless Charging schemas',
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    3,
                    (index) => Container(
                          margin: const EdgeInsets.all(4.0),
                          width: index == 0 ? 15.0 : 10.0,
                          height: index == 0 ? 15.0 : 10.0,
                          decoration: BoxDecoration(
                            color: index == 0
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
                    // Handle button press
                    // Navigate to the next page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OnBoardingPageTwo()), // Replace NextPage() with your next page
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(size.width, 0.0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width / 2, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
