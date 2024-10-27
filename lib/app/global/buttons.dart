import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutlineButton extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double fontsize;
  final FontWeight? fontweight;

  const OutlineButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,required this.fontsize, this.fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth ?? Get.width * 0.8,
        height: buttonHeight ?? 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor ??Colors.white,
            fontSize: fontsize,
            fontWeight: fontweight??FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
