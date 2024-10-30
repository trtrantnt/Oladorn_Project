// lib/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Đảm bảo import MyHomePage từ main.dart

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quên Mật Khẩu'),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.black, // Màu nền đen
                padding: const EdgeInsets.all(16.0), // Khoảng cách xung quanh logo
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
              // Nút Gửi Yêu Cầu Đặt Lại Mật Khẩu
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12), // Giảm chiều cao nút
                  ),
                  onPressed: () {
                    // Logic xử lý gửi yêu cầu đặt lại mật khẩu
                    // Ví dụ: Điều hướng đến trang chính sau khi gửi yêu cầu
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Main Page')),
                    );
                  },
                  child: const Text('Gửi Yêu Cầu Đặt Lại Mật Khẩu'),
                ),
              ),
              const SizedBox(height: 16),
              // Nút Quay Lại Đăng Nhập
              TextButton(
                onPressed: () {
                  // Logic quay lại trang đăng nhập
                  Navigator.pop(context);
                },
                child: const Text('Quay Lại Đăng Nhập', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
