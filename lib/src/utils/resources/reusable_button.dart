import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class ReusableFloatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ReusableFloatButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: poppins,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ReusableOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ReusableOutlineButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: kTomato,
          width: 1.5,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: poppins,
          color: kTomato,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
