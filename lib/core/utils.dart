import 'dart:convert';

import 'package:flutter/material.dart';

class Utils {
  static String formatJson(String jsonString) {
    try {
      final jsonObject = json.decode(jsonString);
      return const JsonEncoder.withIndent('  ').convert(jsonObject);
    } catch (e) {
      debugPrint('Invalid JSON: $e');
      return 'Invalid JSON: $jsonString';
    }
  }
}

extension StringExtension on String {
  String formatJson() => Utils.formatJson(this);
}
