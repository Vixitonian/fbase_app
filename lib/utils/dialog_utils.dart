import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class DialogUtils {
  static showLoadingDialog(BuildContext context, String text) {}

  static showAlertDialog({required String title, required String content}) {
    OneContext().showDialog(builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
      );
    });
  }
}
