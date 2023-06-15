import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/set_profile_id/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/set_profile_id/widget/cta_button.dart';

class SetProfileIDPage extends GetView<SetProfilePageController> {
  const SetProfileIDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0A0C0F),
      ),
      backgroundColor: const Color(0xFF0A0C0F),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '아이디 설정하기',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              '노래 선곡을 했을 때 다른 사용자들에게 표시될 아이디입니다.',
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 24),
            TextField(
              autofocus: true,
              controller: controller.textEditingController,
              style: const TextStyle(
                fontSize: 24,
              ),
              cursorColor: Colors.white,
              maxLength: 20,
              onChanged: (_) => controller.onCodeChange(),
              inputFormatters: [UpperCaseTextFormatter()],
            ),
            Obx(() {
              if (controller.idAlreadyExists.value) {
                return const Text('이미 존재하는 id입니다.', style: TextStyle(color: Color(0xFFE13E3E)));
              } else {
                return Container();
              }
            }),
            const Spacer(),
            Obx(
              () => controller.isCtaBtnEnabled.value
                  ? CTAButton(
                      onTap: controller.setProfileId,
                    )
                  : const CTAButtonDisabled(),
            ),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
