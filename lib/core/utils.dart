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

  static int? stringToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}

extension StringExtension on String {
  String formatJson() => Utils.formatJson(this);
}
