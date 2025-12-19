import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user?.photoURL ?? ''),
            ),
            const SizedBox(height: 10),
            Text(user?.displayName ?? ''),
            Text(user?.email ?? ''),
          ],
        ),
      ),
    );
  }
}
