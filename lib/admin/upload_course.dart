import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadCourse extends StatelessWidget {
  UploadCourse({super.key});

  final title = TextEditingController();
  final video = TextEditingController();
  final pdf = TextEditingController();
  final ppt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Course")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: title, decoration: const InputDecoration(labelText: "Course Title")),
            TextField(controller: video, decoration: const InputDecoration(labelText: "Video URL")),
            TextField(controller: pdf, decoration: const InputDecoration(labelText: "PDF URL")),
            TextField(controller: ppt, decoration: const InputDecoration(labelText: "PPT URL")),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Save"),
              onPressed: () async {
                await FirebaseFirestore.instance.collection('courses').add({
                  'title': title.text,
                  'video': video.text,
                  'pdf': pdf.text,
                  'ppt': ppt.text,
                  'createdAt': Timestamp.now(),
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
