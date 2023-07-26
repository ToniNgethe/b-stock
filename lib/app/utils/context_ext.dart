import 'package:flutter/material.dart';

extension NotificationUtil on BuildContext {
  void displaySnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1000),
      content: Text(message),
    ));
  }
}
