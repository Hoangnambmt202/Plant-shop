import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:plant_shoap_app/view/register/registerScreen.dart';
import 'package:plant_shoap_app/splash_screen.dart';
import 'package:plant_shoap_app/screen/homeScreen.dart'; // Thêm trang Home
import 'package:plant_shoap_app/utils/color_category.dart';

void main() {
  runApp(const MainProject());
}

class MainProject extends StatelessWidget {
  const MainProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        title: 'Plant shop Nam',
        theme: ThemeData(
          dialogTheme: DialogTheme(
              backgroundColor: regularWhite, surfaceTintColor: regularWhite),
        ),
        debugShowCheckedModeBanner: false,
        // Khai báo route ban đầu là splash screen hoặc trang đăng ký
        initialRoute: '/splash',
        home: SplashScreen(),
        // Khai báo các route
      ),
    );
  }
}
