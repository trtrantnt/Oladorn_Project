// lib/main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'chat_list_screen.dart';
import 'search_screen.dart';
import 'notifications_screen.dart';
import 'video_player_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Chỉ số của tab được chọn

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // Danh sách các widget cho từng tab
    List<Widget> _widgetOptions = <Widget>[
      PostList(), // Sử dụng widget PostList cho tab đầu tiên
      const SearchScreen(), // Tab tìm kiếm
      const ChatListScreen(), // Tab chat
      const NotificationsScreen(),
      const ProfileScreen(username: 'tannguyen8386', displayName: 'Trần Tấn Nguyên', bio: 'Hello World', posts: []) // Sử dụng ProfileScreen
    ];



    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Căn giữa
          children: [
            Text(
              'Oladorn',
              style: const TextStyle(
                fontFamily: 'Italianno', // Font Italianno
                fontSize: 30, // Kích thước chữ
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Điều hướng đến màn hình tìm kiếm
                    setState(() {
                      _selectedIndex = 1; // Chuyển đến tab tìm kiếm
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    // Điều hướng đến màn hình thông báo
                    setState(() {
                      _selectedIndex = 3; // Chuyển đến tab thông báo
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex], // Hiển thị widget theo chỉ số được chọn
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF5790DF), // Màu nền của thanh navbar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Căn giữa các nút
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home_filled),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () => _onItemTapped(2), // Chuyển đến tab chat
            ),
            const SizedBox(width: 40), // Khoảng cách cho nút +
            IconButton(
              icon: const Icon(Icons.play_circle_outlined),
              onPressed: () => _onItemTapped(3), // Tab thông báo
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => _onItemTapped(4), // Tab Profile
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 16), // Giảm khoảng cách với thanh điều hướng
        child: FloatingActionButton(
          onPressed: () {
            // Điều hướng đến trang tạo post
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreatePostScreen()),
            );
          },
          child: const Icon(Icons.add),
          shape: const CircleBorder(), // Giữ hình dạng tròn
          backgroundColor: Colors.white.withOpacity(0.8), // Nền mờ
          elevation: 6, // Thêm độ nổi cho nút
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Đặt FAB ở giữa
    );
  }
}

class PostList extends StatelessWidget {
  // Giả lập một số bài đăng
  final List<Map<String, String>> posts = [
    {
      'username': 'locdeptrai',
      'displayName': 'Lộc Đẹp Trai',
      'avatarUrl': 'assets/avatar1.jpg',
      'imageUrl': 'assets/story1.jpg',
    },
    {
      'username': 'SonfanT1',
      'displayName': 'Sơn Fan T1',
      'avatarUrl': 'assets/avatar2.jpg',
      'imageUrl': 'assets/story2.jpg',
    },
    {
      'username': 'Katinat',
      'displayName': 'Katinat Official',
      'avatarUrl': 'assets/avatar3.jpg',
      'imageUrl': 'assets/story3.jpg',
    },
    // Thêm nhiều bài đăng ở đây...
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar và tên người dùng
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(post['avatarUrl']!),
                ),
                title: Text(post['displayName']!),
                subtitle: Text('@${post['username']}'),
              ),
              // Hình ảnh bài đăng
              Image.asset(
                post['imageUrl']!,
                fit: BoxFit.cover,
              ),
              // Các nút phía dưới ảnh
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border), // Biểu tượng tim
                          onPressed: () {
                            // Logic thả tim
                          },
                        ),
                        const Text('0'), // Số lượng thả tim
                        IconButton(
                          icon: const Icon(Icons.comment), // Biểu tượng comment
                          onPressed: () {
                            // Logic bình luận
                          },
                        ),
                        const Text('0'), // Số lượng bình luận
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.save_outlined), // Biểu tượng lưu
                          onPressed: () {
                            // Logic lưu bài viết
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.send), // Biểu tượng gửi
                          onPressed: () {
                            // Logic gửi bài viết
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


// Giả định bạn đã tạo trang tạo post
class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo Post'),
      ),
      body: Center(
        child: const Text('Nội dung tạo post sẽ nằm ở đây'),
      ),
    );
  }
}
