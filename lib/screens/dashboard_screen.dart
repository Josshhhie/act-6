import 'package:flutter/material.dart';
import 'newitem_screen.dart';
import 'itemView_screen.dart'; // Import the item view screen

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      "title": "4-103 IT Elective 5",
      "subtitle": "Computer Studies",
      "image": "assets/josh.jpg",
      "description":
          "Fun Fact: Flutter’s hot reload feature lets you see code changes instantly without restarting the app, making development super fast! 🚀 Also, Dart, Flutter’s programming language, was originally designed for web development before becoming the backbone of Flutter apps."
    },
    {
      "title": "4-104 IT Elective 6",
      "subtitle": "Computer Studies",
      "image": "assets/vive.jpg",
      "description":
          "Fun Fact: Flutter doesn’t use native UI components—instead, it renders everything from scratch using its own high-performance graphics engine, Skia! This is why Flutter apps look consistent across different platforms. 🎨🚀"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Hides back button
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: courses.map((course) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemViewScreen(
                      title: course["title"]!,
                      subtitle: course["subtitle"]!,
                      image: course["image"]!,
                      description: course["description"]!,
                    ),
                  ),
                );
              },
              child: _buildCourseCard(course),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewItemScreen()),
          );
        },
        backgroundColor: const Color(0xFFF76300),
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }

  Widget _buildCourseCard(Map<String, String> course) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              course["image"]!,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course["title"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    course["subtitle"]!,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
