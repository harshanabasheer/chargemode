import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static bool isOtpVerified = false;
  static String? refreshToken;
  static SharedPreferences? localStorage;
  static Future<SharedPreferences> initialLocalStorage() async {
    localStorage ??= await SharedPreferences.getInstance();
    return localStorage!;
  }

  static setOtpVarified() {
    localStorage?.setBool("otpverify", true);
  }

  static clearLocalStorage(){

     localStorage?.clear();
  }

  static getVerified() {
    return localStorage?.getBool("otpverify");
  }

  static setToken(String token) {
    localStorage?.setString("refreshtoken", token);
  }

  static getToken() {
    return localStorage?.getString("refreshtoken");
  }
}
