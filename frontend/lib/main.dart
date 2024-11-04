import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:plant_shoap_app/view/register/registerScreen.dart';
import 'package:plant_shoap_app/splash_screen.dart';
import 'package:plant_shoap_app/view/home/home_screens/home_screen.dart'; // Thêm trang Home
import 'package:plant_shoap_app/utils/color_category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        title: 'Plant shop',
        theme: ThemeData(
          dialogTheme: DialogTheme(
              backgroundColor: regularWhite, surfaceTintColor: regularWhite),
        ),

        debugShowCheckedModeBanner: false,
        // Khai báo route ban đầu là splash screen hoặc trang đăng ký
        initialRoute: '/splash',
        // Khai báo các route
        getPages: [
          GetPage(
            name: '/splash',
            page: () => SplashScreen(), // Màn hình splash ban đầu
          ),
          GetPage(
            name: '/signUp',
            page: () => RegisterPage(), // Trang đăng ký
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(), // Trang Home
          ),
        ],
      ),
    );
  }
}
