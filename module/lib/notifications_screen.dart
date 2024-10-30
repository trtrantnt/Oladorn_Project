// lib/notifications_screen.dart
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách thông báo mẫu
    final List<Map<String, String>> notifications = [
      {
        'title': 'Lộc Đẹp Trai đã thích bài viết của bạn.',
        'timestamp': '2 phút trước',
      },
      {
        'title': 'Sơn Fan T1 đã bình luận: "Bài viết rất hay!"',
        'timestamp': '10 phút trước',
      },
      {
        'title': 'Katinat Official đã theo dõi bạn.',
        'timestamp': '20 phút trước',
      },
      {
        'title': 'Bạn có một yêu cầu kết bạn mới.',
        'timestamp': '1 giờ trước',
      },
      {
        'title': 'Có một tin nhắn mới từ Sơn Fan T1.',
        'timestamp': '3 giờ trước',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông Báo'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(notification['title']!),
              subtitle: Text(notification['timestamp']!),
              trailing: const Icon(Icons.more_horiz), // Thêm biểu tượng
            ),
          );
        },
      ),
    );
  }
}
