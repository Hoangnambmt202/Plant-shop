import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Thực hiện đăng xuất hoặc quay lại trang đăng nhập
              // Có thể sử dụng Get.offNamed('/login') hoặc các phương thức khác tùy thuộc vào logic ứng dụng
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to the Home Screen!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Here is some content:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // Danh sách sản phẩm hoặc nội dung khác
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Số lượng item bạn muốn hiển thị
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Item ${index + 1}"),
                    ),
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
