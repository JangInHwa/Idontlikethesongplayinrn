import 'package:flutter/widgets.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class JoinSpaceButton extends StatelessWidget {
  final void Function()? onTap;
  const JoinSpaceButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF22242A),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 40,
        height: 40,
        child: Center(
          child: Icon(PhosphorIcons.bold.plus),
        ),
      ),
    );
  }
}
