import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesHelper {
  Future<String?> getAccessToken();

  Future<void> setAccessToken(String accessToken);

  Future<String?> getAppVersion();

  Future<void> setAppVersion(String version);

  Future<void> setAppLanguage(String language);

  Future<String?> getAppLanguage();


  Future<int?> getUserLoggedInMode();

  Future<void> setUserLoggedInMode(int loggedInMode);
  Future<void> setUserName(String userName);
  Future<String?> getUserName();

  Future<String> getApplicationTheme();

  Future<void> setApplicationTheme(String applicationTheme);

  Future<String?> getUserId();

  Future<String?> getUserLastName();

  Future<void> setUserLastName(String lastName);

  Future<String?> getUserFirstName();

  Future<void> setUserFirstName(String firstName);

  Future<String?> getUserAvatar();

  Future<void> setUserAvatar(String avatar);


  Future<void> setUserID(String id);

  Future<String?> getUserMobileNumber();

  Future<void> setUserMobileNumber(String mobileNumber);

  Future<String?> getUserShaba();

  Future<void> setUserShaba(String shaba);

  Future<void> userClear( );

}

class AppPreferencesHelper implements PreferencesHelper {
  static AppPreferencesHelper? appPreferencesHelper;

  final String _PREF_KEY_APP_LANGUAGE = "_PREF_KEY_APP_LANGUAGE";


  // ignore: non_constant_identifier_names
  final String _PREF_KEY_ACCESS_TOKEN = "PREF_KEY_ACCESS_TOKEN";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_LOGGED_IN_MODE = "PREF_KEY_USER_LOGGED_IN_MODE";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_APP_VERSION = "_PREF_KEY_APP_VERSION";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_APPLICATION_THEME = "PREF_KEY_APPLICATION_THEME";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_ID= "PREF_KEY_USER_ID";

  final String _PREF_KEY_USER_NAME= "PREF_KEY_USER_NAME";


  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_FIRST_NAME= "_PREF_KEY_USER_FISRT_NAME";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_LAST_NAME= "_PREF_KEY_USER_LAST_NAME";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_MOBILE_NUMBER= "PREF_KEY_USER_MOBILE_NUMBER";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_AVATAR= "_PREF_KEY_USER_AVATAR";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_PROFILE_SELECTED_ID= "PREF_KEY_USER_PROFILE_SELECTED_ID";

  // ignore: non_constant_identifier_names
  final String _PREF_KEY_USER_SHABA= "PREF_KEY_USER_SHABA";

  @override
  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_ACCESS_TOKEN);
  }

  @override
  Future<int> getUserLoggedInMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_KEY_USER_LOGGED_IN_MODE) ?? 0;
  }

  @override
  Future<void> setAccessToken(String? accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_ACCESS_TOKEN, accessToken!);
  }

  @override
  Future<void> setUserLoggedInMode(int loggedInMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_PREF_KEY_USER_LOGGED_IN_MODE, loggedInMode);
  }

  @override
  Future<void> userClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? selectedId= prefs.getInt(_PREF_KEY_USER_PROFILE_SELECTED_ID);
    await prefs.clear();
    await setAccessToken("");

    await prefs.setInt(_PREF_KEY_USER_LOGGED_IN_MODE, 0);
    await prefs.setInt(_PREF_KEY_USER_PROFILE_SELECTED_ID, selectedId ?? 0);
    // print('hear 01');
  }

  @override
  Future<String> getApplicationTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_APPLICATION_THEME) ?? '';
  }


  @override
  Future<String?> getAppLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_APP_LANGUAGE);
  }

  @override
  Future<void> setAppLanguage(String appLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_APP_LANGUAGE, appLanguage);
  }

  @override
  Future<void> setApplicationTheme(String applicationTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_APPLICATION_THEME, applicationTheme);

  }

  @override
  Future<String?> getUserAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_AVATAR);
  }
  @override
  Future<void> setUserAvatar(String avatar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_AVATAR, avatar);
  }
  //
  @override
  Future<String?> getUserLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_LAST_NAME);
  }

  @override
  Future<String?> setUserLastName(String lastName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_LAST_NAME,lastName);
  }
  //
  @override
  Future<String?> getUserFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_FIRST_NAME);
  }
  //
  /*@override
  Future<void> setAvatar(String avatar) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_AVATAR, avatar);
  }*/
  //
  @override
  Future<void> setUserFirstName(String firstName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_FIRST_NAME, firstName);
  }
  //
  // @override
  // Future<void> setLastName(String lastName) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_PREF_KEY_USER_LAST_NAME, lastName);
  // }
  //
  // @override
  // Future<void> setUserName(String userName) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_PREF_KEY_USER_NAME, userName);
  // }

  @override
  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_ID);
  }

  @override
  Future<void> setUserID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_ID, id);
  }


  @override
  Future<String?> getUserMobileNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_MOBILE_NUMBER);
  }

  @override
  Future<void> setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_NAME, userName);
  }

  @override
  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_NAME);
  }

  @override
  Future<void> setUserMobileNumber(String mobileNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_MOBILE_NUMBER, mobileNumber);
  }

  @override
  Future<int?> getUserProfileSelectedId() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_KEY_USER_PROFILE_SELECTED_ID);
  }

  @override
  Future<void> setUserProfileSelectedId(int userProfileSelectedId)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_PREF_KEY_USER_PROFILE_SELECTED_ID, userProfileSelectedId);
  }

  @override
  Future<String?> getAppVersion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_APP_VERSION);
  }

  @override
  Future<void> setAppVersion(String version) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_APP_VERSION, version);
  }

  @override
  Future<String?> getUserShaba()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_KEY_USER_SHABA);
  }

  @override
  Future<void> setUserShaba(String shaba)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_PREF_KEY_USER_SHABA, shaba);
  }







//
// @override
// Future<String?> getEmail() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString(_PREF_KEY_USER_EMAIL);
// }
//
// @override
// Future<void> setEmail(String email) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setString(_PREF_KEY_USER_EMAIL, email);
// }
//
// @override
// Future<bool> getIsVerifyEmail() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getBool(_PREF_KEY_USER_IS_VERIFY_EMAIL)??false;
// }
//
// @override
// Future<void> setIsVerifyEmail(bool isVerify) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   await prefs.setBool(_PREF_KEY_USER_IS_VERIFY_EMAIL, isVerify);
// }
}
