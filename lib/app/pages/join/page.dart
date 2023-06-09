import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/controller.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/widget/cta_button.dart';
import 'package:i_dont_like_the_song_playin_rn/app/pages/join/widget/space_tip_chip.dart';

class JoinPage extends GetView<JoinPageController> {
  const JoinPage({super.key});

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
              '스페이스 참가하기',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              '스페이스 참가 코드 6자리를 입력해주세요',
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
              maxLength: 6,
              onChanged: (_) => controller.onCodeChange(),
              inputFormatters: [UpperCaseTextFormatter()],
            ),
            Obx(() {
              if (controller.noSpaceFoundMessageEnabled.value) {
                return const Text('잘못된 참가 코드입니다', style: TextStyle(color: Color(0xFFE13E3E)));
              } else {
                return Container();
              }
            }),
            Obx(() {
              if (controller.alreadyJoinedMessageEnabled.value) {
                return const Text('이미 참가중인 스페이스입니다', style: TextStyle(color: Color(0xFFE13E3E)));
              } else {
                return Container();
              }
            }),
            Obx(() {
              if (controller.resSpace.value != null) {
                return SpaceTipChip(space: controller.resSpace.value!);
              } else {
                return Container();
              }
            }),
            const Spacer(),
            Obx(
              () => controller.isCtaBtnEnabled.value
                  ? CTAButton(
                      onTap: () => controller.joinSpace(controller.resSpace.value!),
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
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
