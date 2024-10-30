// lib/signup_screen.dart
import 'package:flutter/material.dart';
import 'main.dart'; // Đảm bảo import MyHomePage từ main.dart

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký'),
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
                    labelText: 'Tên Đăng Nhập',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Xác Nhận Mật Khẩu',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Nút Đăng Ký
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12), // Giảm chiều cao nút
                  ),
                  onPressed: () {
                    // Logic xử lý đăng ký
                    // Ví dụ: Điều hướng đến trang chính sau khi đăng ký thành công
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Main Page')),
                    );
                  },
                  child: const Text('Đăng Ký'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
