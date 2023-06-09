import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/widgets/login_with_apple_button.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/login/widgets/login_with_google_button.dart';

class LogInPage extends GetView<LoginPageController> {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0C0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Image.asset('asset/image/idltsprn.png', width: 300),
                ),
              ),
              const LogInWithAppleButton(),
              const SizedBox(height: 16),
              const LogInWithGoogleButton(),
              const SizedBox(height: 16),
              const Text(
                '로그인 함으로써 개인정보처리방침에 동의합니다.',
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
