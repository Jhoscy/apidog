// lib/utils/alert_utils.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void showPlatformSpecificAlert(BuildContext context, {String? message}) {
  if (Platform.isIOS) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(message ?? 'iOS Alert'),
          content: Text(message ?? 'This is a native iOS-style alert.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
            ),
          ],
        );
      },
    );
  } else {
    // Use a different alert style for Android or other platforms
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message ?? 'Android Alert'),
          content: Text(message ?? 'This is a native Android-style alert.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
            ),
          ],
        );
      },
    );
  }
}
