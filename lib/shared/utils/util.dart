import 'package:flutter/material.dart';

class Util {
  static Color getContainerValueColor(bool visible) =>
      visible ? Colors.white : const Color.fromARGB(255, 161, 161, 161);

  static IconData getVisibilityIconData(bool visible) =>
      visible ? Icons.visibility : Icons.visibility_off;

  static String getFormatedPercentage(double percentage, String ticker) {
    return "${percentage.toStringAsFixed(2)} $ticker";
  }
}
