import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/user.dart'; // Đường dẫn đến file User của bạn
import '../../stateNotifier/authStateNotifier.dart'; // Đường dẫn đến file AuthStateNotifier của bạn

class RegisterPage extends ConsumerWidget {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authStateNotifierProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _fullnameController,
                decoration: InputDecoration(labelText: "Full name"),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Phone"),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: "Address"),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true, // Mật khẩu nên được ẩn
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        final user = User(
                          full_name: _fullnameController.text,
                          email: _emailController.text,
                          address: _addressController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                        );

                        ref
                            .read(authStateNotifierProvider.notifier)
                            .registerUser(user)
                            .then((isRegistered) {
                          if (isRegistered) {
                            // Hiển thị thông báo thành công
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Đăng ký thành công")),
                            );
                            // Chuyển về trang Home
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            // Hiển thị thông báo thất bại
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      "Đăng ký thất bại, vui lòng thử lại")),
                            );
                          }
                        });
                      },
                      child: Text("Register"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
