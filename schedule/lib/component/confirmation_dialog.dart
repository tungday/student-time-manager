import 'package:flutter/material.dart';

class ConfirmationDialog {
  static Future<bool?> showConfirmationDialog(BuildContext context, {
    required String title,
    required String content,
    String cancelLabel = "Cancel",
    String confirmLabel = "Confirm"
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelLabel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(confirmLabel),
            ),
          ],
        );
      },
    );
  }
}