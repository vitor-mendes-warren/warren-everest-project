import 'package:flutter/material.dart';

class EntryValue extends StatelessWidget {
  const EntryValue({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      value,
      style: TextStyle(
        fontFamily: "Mansny-light",
        fontWeight: FontWeight.bold,
        fontSize: size.height * .022,
      ),
    );
  }
}
