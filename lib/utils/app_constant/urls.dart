
class Urls{
  static const bool isTest=false;

  static const String baseUrl = "${isTest?"https://api.amir-3409.ir/":"https://api.mohaseb2000.ir/"}";
  static const String apiUrl = "${baseUrl}api/v1/";

  static const String login = 'auth/otp';
  static const String loginOtp = 'auth/otp/verify';

  static const String loginPassword = 'auth/password-login';


}