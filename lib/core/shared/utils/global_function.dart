import 'package:flutter/material.dart';

class GlobalFunctions {
  /// Returns whether a dynamic value PROBABLY
  /// has the isEmpty getter/method by checking
  /// standard dart types that contains it.
  ///
  /// This is here to for the 'DRY'
  static bool isEmpty(dynamic value) {
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is Iterable || value is Map) {
      return value.isEmpty as bool;
    }
    return false;
  }

  /// Checks if data is null.
  static bool isNull(dynamic value) => value == null;

  /// Checks if data is null or blank (empty or only contains whitespace).
  static bool isNullOrBlank(dynamic value) {
    if (isNull(value)) {
      return true;
    }

    // Pretty sure that isNullBlank should't be validating
    // iterables... but I'm going to keep this for compatibility.
    return isEmpty(value);
  }

  static String setCharColor(String text) {
    var color = "";
    String char = "";
    try {
      if (text != '') {
        List splitName = text.split(" ");
        if (splitName.length > 1) {
          char = splitName[0][0] + splitName[1][0];
        } else {
          char = splitName[0][0];
        }
      } else {
        char = "";
      }

      char = char.substring(0).toUpperCase();
      var charCode = char.codeUnitAt(0);

      if (charCode >= 65 && charCode <= 70) {
        color = '#E57D1E';
      } else if (charCode >= 71 && charCode <= 75) {
        color = '#8539AC';
      } else if (charCode >= 76 && charCode <= 80) {
        color = '#3296DC';
      } else if (charCode >= 81 && charCode <= 85) {
        color = '#26C56A';
      } else {
        color = '#324150';
      }
    } catch (err) {
      color = '#324150';
    }

    return color;
  }

  static String setCharName(String value) {
    String name = "";

    if (value != '') {
      List splitName = value.split(" ");

      if (splitName.length == 2) {
        String firstAlph = splitName[0][0];
        String secAlph = splitName[1].isEmpty ? '-' : splitName[1][0];
        name = firstAlph + secAlph;
      } else if (splitName.length > 2) {
        String firstAlph = splitName[0].isNotEmpty ? splitName[0][0] : '-';
        String secAlph = splitName[2].isEmpty ? '-' : splitName[2][0];
        name = firstAlph + secAlph;
      } else {
        name = splitName[0][0];
      }
    }

    return name;
  }
}

extension ColorBrightness on Color {
  Color darken([double amount = .3]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .3]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
