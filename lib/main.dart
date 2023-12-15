import 'package:chargemode/controller/auth_controller.dart';
import 'package:chargemode/controller/bottomBarController.dart';
import 'package:chargemode/screens/bottombar.dart';
import 'package:chargemode/screens/home_page.dart';
import 'package:chargemode/screens/splash_screen.dart';
import 'package:chargemode/services/preference_service.dart';
import 'package:chargemode/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialLocalStorage();
  LocalStorage.isOtpVerified= LocalStorage.getVerified()?? false;


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthController()),
    ChangeNotifierProvider(create: (_) => BottomBarController()),

  ],
    child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(363,755),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home:LocalStorage.isOtpVerified? BottomBar() : const SplashScreen(),

      ),
    );
  }
}

