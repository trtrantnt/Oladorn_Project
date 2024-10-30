// lib/login_screen.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Đảm bảo import MyHomePage từ main.dart
import 'forgot_password_screen.dart'; // Import ForgotPasswordScreen
import 'signup_screen.dart'; // Import SignupScreen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Nhập'),
      ),
      body: SingleChildScrollView( // Thêm SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black, // Màu nền cho logo
                padding: const EdgeInsets.all(16.0), // Padding quanh logo
                child: Image.asset(
                  'assets/logo.png',  // Đường dẫn đến logo
                  width: 300,
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Tài Khoản',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Mật Khẩu',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Nút Đăng Nhập
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Điều hướng đến MyHomePage khi nhấn Đăng Nhập
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Main Page')),
                    );
                  },
                  child: const Text('Đăng Nhập'), // Đổi thành Đăng Nhập
                ),
              ),
              const SizedBox(height: 16),
              // Nút Quên Mật Khẩu
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()), // Thay đổi đường dẫn
                  );
                },
                child: const Text('Quên Mật Khẩu?', style: TextStyle(color: Colors.blue)),
              ),
              // Nút Đăng Ký
              TextButton(
                onPressed: () {
                  // Điều hướng đến SignupScreen khi nhấn Đăng Ký
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()), // Điều hướng đến SignupScreen
                  );
                },
                child: const Text('Đăng Ký', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
