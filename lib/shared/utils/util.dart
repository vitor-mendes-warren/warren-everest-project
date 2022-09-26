import 'package:flutter/material.dart';

class Util {
  static Color getContainerValueColor(bool visible) =>
      visible ? Colors.white : const Color.fromARGB(255, 161, 161, 161);

  static IconData getVisibilityIconData(bool visible) =>
      visible ? Icons.visibility : Icons.visibility_off;

  static String getFormatedPercentage(double percentage, String ticker) {
    return "${percentage.toString()} $ticker";
  }

  static Color getVariationColor(String variation) =>
      variation.trim()[0] == '-' ? Colors.red : Colors.green;

  static String getNinetyDaysAgoToTimestamp() {
    return (DateTime.now()
                .subtract(const Duration(days: 90))
                .millisecondsSinceEpoch /
            1000)
        .round()
        .toString();
  }

  static String getDateTimeNowToTimestamp() {
    return (DateTime.now().millisecondsSinceEpoch / 1000).round().toString();
  }
}
