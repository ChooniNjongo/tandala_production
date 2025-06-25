import 'package:flutter/material.dart';



class NotificationCountWidget extends StatelessWidget {
  final int count;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const NotificationCountWidget({
    super.key,
    required this.count,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 20,
      height: height ?? 20,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFDC3545),
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26E5F7F9),
            offset: Offset(0, 0),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: TextStyle(
            fontFamily: 'Inter Display',
            fontWeight: FontWeight.w500,
            fontSize: 10,
            height: 1.4, // 140% line height
            letterSpacing: 0,
            color: textColor ?? Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}