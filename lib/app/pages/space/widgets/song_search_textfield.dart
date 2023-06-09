import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SongSearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const SongSearchTextField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2F3239),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(
            PhosphorIcons.regular.magnifyingGlass,
            color: Colors.white38,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white, fontSize: 16),
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
