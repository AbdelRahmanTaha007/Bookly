import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.backGroundColor,
    required this.textColor,
    this.borderRaduis,
    this.fontSize,
    required this.text,
  });
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRaduis;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: borderRaduis ?? BorderRadius.circular(12)),
        ),
        onPressed:onPressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
