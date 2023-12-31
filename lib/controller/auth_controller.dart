import 'package:chargemode/screens/bottombar.dart';
import 'package:chargemode/screens/home_page.dart';
import 'package:chargemode/screens/login.dart';
import 'package:chargemode/screens/otp_page.dart';
import 'package:chargemode/screens/update_profile.dart';
import 'package:chargemode/services/api_services.dart';
import 'package:chargemode/services/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:chargemode/screens/profile_page.dart';

class AuthController extends ChangeNotifier {
  bool loading = false;
  bool resendTime = false;
  Map<String,dynamic>?user;
  final ApiService apiService = ApiService();

  void sendOtp(String phone, BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      String result = await apiService.signIn(phone);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpPage(
                    phone: phone,
                  )),
        );
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  void otpVerification(String phone, String otp, BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      String result = await apiService.verifyOtp(phone, otp);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UpdateProfile(phone: phone)),
        );
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  void register(String phone, String firstName, String lastName, String email,
      BuildContext context) async {
    try {
      loading = true;
      notifyListeners();
      String result =
          await apiService.userRegister(phone, firstName, lastName, email);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => BottomBar(
                  )),
        );
      }
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  Future<void> resendOtp(String phone, BuildContext context) async {
    try {
      resendTime = true;
      notifyListeners();
      String result = await apiService.resend(phone);
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(result)));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpPage(
                    phone: phone,
                  )),
        );
      }
      resendTime = false;
      notifyListeners();
    } catch (e) {
      resendTime = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }
  Future<void> fetchData(BuildContext context) async {
    try {
      loading =true;
      notifyListeners();
      final refreshToken = LocalStorage.getToken();
      user = await apiService.getUserDeatail(refreshToken);
      loading =false;
      notifyListeners();
    } catch (e) {
      loading =false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An error occurred during fetch data: ${e.toString()}',
            ),
          ),
        );
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      loading =true;
      notifyListeners();
      final refreshToken = LocalStorage.getToken();

        String result = await apiService.logout(refreshToken);

        if (context.mounted) {

          LocalStorage.clearLocalStorage();
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login(),),);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result)),
          );
        }
      loading =false;
      notifyListeners();
    } catch (e) {
      loading =false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An error occurred during logout: ${e.toString()}',
            ),
          ),
        );
      }
    }
  }


}
