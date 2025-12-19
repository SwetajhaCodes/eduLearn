import 'package:edulearn/student/profile.dart';
import 'package:flutter/material.dart';
import 'course_list.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StudentProfile()),
              );
            },
          )
        ],
      ),
      body: const CourseList(),
    );
  }
}
