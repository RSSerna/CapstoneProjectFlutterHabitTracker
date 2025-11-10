import 'package:flutter/material.dart';

void showToast(
    {required String message,
    required BuildContext context,
    Color backgroundColor = Colors.redAccent}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:
          Text(message.isNotEmpty ? message : 'Please fill in all fields.'),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
    ),
  );
}
