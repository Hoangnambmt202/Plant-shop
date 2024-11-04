import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String prefName = "com.example.plant_shoap_app";

  static String isIntro = "${prefName}isIntro";
  static String signIn = "${prefName}signIn";
  static String homeScreen = "${prefName}homeScreen";

  static setIsIntro(bool sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isIntro, sizes);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool intValue = prefs.getBool(isIntro) ?? true;
    return intValue;
  }

  static setIsSignIn(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(signIn, isFav);
  }

  static getIsSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(signIn) ?? true;
  }

  static setIsHome(bool home)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(homeScreen, home);
  }

  static getIsHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(homeScreen) ?? true;
  }
}
