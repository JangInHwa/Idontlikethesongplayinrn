import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInWithAppleButton extends StatefulWidget {
  const LogInWithAppleButton({super.key});

  @override
  State<LogInWithAppleButton> createState() => _LogInWithAppleButtonState();
}

class _LogInWithAppleButtonState extends State<LogInWithAppleButton> {
  bool tapped = false;

  Future loginWithApple() async {
    try {
      await Supabase.instance.client.auth.signInWithOAuth(
        Provider.apple,
        authScreenLaunchMode: LaunchMode.inAppWebView,
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
      onTap: loginWithApple,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: Container(
        decoration: BoxDecoration(
          color: tapped ? Colors.white10 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white24),
        ),
        padding: EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/image/apple-logo.png', width: 18),
            SizedBox(width: 16),
            Text(
              'Continue with Apple',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
