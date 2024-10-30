// lib/chat_list_screen.dart
import 'package:flutter/material.dart';

import 'message_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Danh sách tin nhắn giả lập
    final List<Map<String, String>> chats = [
      {'name': 'Lộc Đẹp Trai', 'lastMessage': 'Bạn có đó không?', 'avatarUrl': 'assets/avatar1.jpg'},
      {'name': 'Sơn Fan T1', 'lastMessage': 'Hẹn gặp lại!', 'avatarUrl': 'assets/avatar2.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
      {'name': 'Katinat Official', 'lastMessage': 'Có gì mới không?', 'avatarUrl': 'assets/avatar3.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tin nhắn'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat['avatarUrl']!),
            ),
            title: Text(chat['name']!),
            subtitle: Text(chat['lastMessage']!),
            onTap: () {
              // Điều hướng đến màn hình nhắn tin
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen(chat['name']!)),
              );
            },
          );
        },
      ),
    );
  }
}
