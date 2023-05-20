import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SongSearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  const SongSearchTextField({super.key, this.controller, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2F3239),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            PhosphorIcons.regular.magnifyingGlass,
            color: Colors.white38,
          ),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
              onSubmitted: onSubmitted,
              style: TextStyle(color: Colors.white, fontSize: 16),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                isDense: true,
                hintText: "제목, 아티스트, 앨범으로 검색",
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white38),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
