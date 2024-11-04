import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_shoap_app/constant/API_list.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Để lưu trữ token an toàn
import 'package:plant_shoap_app/view/register/registerScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Đăng nhập Nature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _storage = SharedPreferences.getInstance();
  bool _isLoading = false; // Hiển thị loading khi đăng nhập

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              child: Text('Login with Google'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Get.to(RegisterPage());
              },
              child: Text('Don\'t have an account? Register here!'),
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xử lý đăng nhập qua API
  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Gửi request đăng nhập tới API
      final response = await http.post(
        Uri.parse(API_login), // Thay bằng API của bạn
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Kiểm tra và xử lý nếu token là map
        if (responseBody is Map && responseBody.containsKey('token')) {
          final String token = responseBody['token']
              .toString(); // Chuyển token thành chuỗi nếu cần

          // Lưu token vào SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          print('Response body: ${response.body}');

          // Hiển thị thông báo đăng nhập thành công
          _showSuccessDialog();
        } else {
          Get.snackbar('Error', 'Invalid response format');
        }
      } else {
        Get.snackbar('Error', 'Invalid email or password');
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to login: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Hàm hiển thị thông báo thành công
  Future<void> _showSuccessDialog() async {
    await Get.defaultDialog(
      title: 'Login Successful',
      content: Text('Bạn vừa đăng nhập thành công.'),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back(); // Đóng dialog
          Get.offAllNamed('/home'); // Điều hướng về trang home
        },
        child: Text('OK'),
      ),
    );
  }

  // Hàm đăng nhập qua Google
  Future<void> _loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        print("Đăng nhập thành công: ${googleUser.email}");
        // Lưu trữ thông tin người dùng hoặc token từ Google
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', googleUser.email);
        Get.offAllNamed('/home');
      }
    } catch (error) {
      print("Đăng nhập Google thất bại: $error");
      Get.snackbar('Error', 'Failed to login with Google');
    }
  }
}
