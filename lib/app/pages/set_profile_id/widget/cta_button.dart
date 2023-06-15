import 'package:flutter/material.dart';

class CTAButtonBase extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const CTAButtonBase({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class CTAButton extends StatelessWidget {
  final void Function()? onTap;
  const CTAButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CTAButtonBase(
      onTap: onTap,
      child: const Text(
        '계속하기',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}

class CTAButtonDisabled extends StatelessWidget {
  const CTAButtonDisabled({super.key});

  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.3,
      child: CTAButton(),
    );
  }
}
