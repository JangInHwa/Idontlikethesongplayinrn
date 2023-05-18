import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInWithGoogleButton extends StatefulWidget {
  const LogInWithGoogleButton({super.key});

  @override
  State<LogInWithGoogleButton> createState() => _LogInWithGoogleButtonState();
}

class _LogInWithGoogleButtonState extends State<LogInWithGoogleButton> {
  bool tapped = false;

  Future loginWithGoogle() async {
    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        Provider.google,
        authScreenLaunchMode: LaunchMode.externalApplication,
        redirectTo: 'com.uglyonlytoday.idontlikethesongplayinrn://login-callback/',
      );
    } on AuthException catch (e) {
      log(e.toString());
    }
  }

  void onTapDown(_) {
    tapped = true;
    setState(() {});
  }

  void onTapUp(_) {
    tapped = false;
    setState(() {});
  }

  void onTapCancel() {
    tapped = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loginWithGoogle,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Container(
        decoration: BoxDecoration(
          color: tapped ? Colors.grey[300] : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/google-logo.png', width: 18),
            SizedBox(width: 16),
            Text(
              'Log In With Google',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
