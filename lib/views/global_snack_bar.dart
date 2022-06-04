import 'package:flutter/material.dart';

class GlobalSnackBar {
  GlobalSnackBar._();
  static buildSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
