import 'dart:convert';
import 'package:chargemode/services/preference_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl =
      "https://as-uat.console.chargemod.com/temporary/sde1flutterATSR/64941897fdb322dbf94ad2b8/6494141957d29409895704d2/";
  final String appVersion = "1.0.0";

  Future<String> signIn(String phone) async {
    final url = Uri.parse("$baseUrl$appVersion/signIn");
    var responce = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'mobile': phone}));
    if (responce.statusCode == 200) {
      return "OTP send successfully";
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> verifyOtp(String phone, String otp) async {
    final url = Uri.parse("$baseUrl$appVersion/verify");
    var responce = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'mobile': phone, 'otp': otp}));
    if (responce.statusCode == 200) {
      return "OTP verified successfully";
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> userRegister(
      String phone, String firstName, String lastName, String email) async {
    final url = Uri.parse("$baseUrl$appVersion/register");
    var responce = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'mobile': phone,
          'first_name': firstName,
          'last_name': lastName,
          'email': email
        }));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      LocalStorage.setOtpVarified();
      LocalStorage.setToken(data['refreshToken'][0]);
      return "User Registred Succesfully";
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> resend(String phone) async {
    final url = Uri.parse("$baseUrl$appVersion/resend");
    var responce = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {'mobile': phone, "type": "text"},
      ),
    );
    if (responce.statusCode == 200) {
      return "OTP re-send successfully";
    } else {
      throw Exception("Failed");
    }
  }

  Future<String> logout(String refreshToken) async {
    final url = Uri.parse("${baseUrl}logout");
    var responce = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {'refreshToken': refreshToken},
      ),
    );
    if (responce.statusCode == 200) {
      return "Logout successfully";
    } else {
      throw Exception("Failed");
    }
  }
}
