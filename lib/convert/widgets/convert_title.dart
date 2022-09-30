import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ConvertTitle extends StatelessWidget {
  final String title;
  const ConvertTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AutoSizeText(
      title,
      style: TextStyle(
        fontFamily: "Mansny regular",
        fontWeight: FontWeight.bold,
        fontSize: size.height * .037,
      ),
    );
  }
}
