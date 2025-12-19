import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseView extends StatelessWidget {
  final String title;
  final String video;
  final String pdf;
  final String ppt;

  const CourseView({
    super.key,
    required this.title,
    required this.video,
    required this.pdf,
    required this.ppt,
  });

  Future<void> openLink(String url) async {
    if (url.isNotEmpty) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(onPressed: () => openLink(video), child: const Text("Watch Video")),
            ElevatedButton(onPressed: () => openLink(pdf), child: const Text("Open PDF")),
            ElevatedButton(onPressed: () => openLink(ppt), child: const Text("Open PPT")),
            const SizedBox(height: 20),
            const Text("MCQs can be added here"),
          ],
        ),
      ),
    );
  }
}
