import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ConvertTitle extends StatelessWidget {
  const ConvertTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText(
      'Quanto você gostaria de converter?',
      style: TextStyle(
        fontFamily: "Mansny regular",
        fontWeight: FontWeight.bold,
        fontSize: size.height * .037,
      ),
    );
  }
}
