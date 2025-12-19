import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../admin/admin_dashboard.dart';
import '../student/student_dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> signIn(BuildContext context) async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCred =
    await FirebaseAuth.instance.signInWithCredential(credential);

    final email = userCred.user!.email!.toLowerCase();

    if (!context.mounted) return;

    if (email == 'swetajhaxx@gmail.com') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AdminDashboard()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const StudentDashboard()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.login),
          label: const Text("Sign in with Google"),
          onPressed: () => signIn(context),
        ),
      ),
    );
  }
}
