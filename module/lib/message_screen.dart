// lib/message_screen.dart
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String username; // Tên người dùng

  const MessageScreen(this.username, {Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();

  // Danh sách tin nhắn giả lập
  final List<Map<String, String>> _messages = [
    {
      'text': 'Chào bạn!',
      'sender': 'locdeptrai', // Tên người gửi
    },
    {
      'text': 'Hẹn gặp lại!',
      'sender': 'SonfanT1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username), // Tên người nhắn
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                bool isMe = message['sender'] == 'locdeptrai'; // Giả sử 'locdeptrai' là người dùng hiện tại

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue[200] : Colors.grey[300], // Màu nền tùy thuộc vào người gửi
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['text']!,
                      style: TextStyle(color: isMe ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Nhắn tin...',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Logic gửi tin nhắn
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messages.add({
                          'text': _messageController.text,
                          'sender': 'locdeptrai', // Giả sử 'locdeptrai' là người dùng hiện tại
                        });
                        _messageController.clear(); // Xóa nội dung sau khi gửi
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}