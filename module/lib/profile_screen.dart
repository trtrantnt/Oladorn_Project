// lib/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username; // Tên người dùng
  final String displayName; // Tên hiển thị
  final String bio; // Mô tả ngắn
  final List<String> posts; // Danh sách đường dẫn ảnh bài đăng

  const ProfileScreen({
    Key? key,
    required this.username,
    required this.displayName,
    required this.bio,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username), // Hiển thị tên người dùng
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ảnh đại diện và thông tin người dùng
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50, // Kích thước ảnh đại diện
                  backgroundImage: AssetImage('assets/avatar1.jpg'), // Thay bằng ảnh đại diện của bạn
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@$username',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(bio), // Mô tả ngắn
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(), // Đường phân cách
          // Danh sách bài đăng
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Số cột
                childAspectRatio: 1, // Tỉ lệ chiều rộng và chiều cao
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    posts[index], // Đường dẫn ảnh bài đăng
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
