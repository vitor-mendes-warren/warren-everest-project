import 'package:flutter/material.dart';
import 'package:warren_task_one/shared/utils/assets.dart';

FontWeight getFontWeight(int pageindex, Set<String> icons) {
  FontWeight fontWeight = FontWeight.normal;
  switch (pageindex) {
    case 0:
      {
        if (icons == warrenIcons) {
          fontWeight = FontWeight.bold;
        }
        break;
      }

    case 1:
      {
        if (icons == cryptoIcons) {
          fontWeight = FontWeight.bold;
        }
        break;
      }
  }
  return fontWeight;
}
