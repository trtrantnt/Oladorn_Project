// lib/search_screen.dart
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchHistory = []; // Danh sách lịch sử tìm kiếm

  void _addToHistory(String query) {
    if (!_searchHistory.contains(query)) {
      setState(() {
        _searchHistory.add(query); // Thêm truy vấn vào lịch sử
      });
    }
    _searchController.clear(); // Xóa nội dung trong TextField sau khi tìm kiếm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tìm kiếm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Tìm kiếm...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text;
                    if (query.isNotEmpty) {
                      _addToHistory(query); // Thêm truy vấn vào lịch sử khi tìm kiếm
                    }
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lịch sử tìm kiếm',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_searchHistory[index]),
                    onTap: () {
                      // Logic cho việc nhấn vào lịch sử tìm kiếm (nếu cần)
                      _searchController.text = _searchHistory[index]; // Điền vào ô tìm kiếm
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
