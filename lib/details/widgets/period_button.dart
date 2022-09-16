import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PeriodButton extends StatelessWidget {
  const PeriodButton({
    Key? key,
    required this.period,
  }) : super(key: key);

  final String period;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15, top: 15),
      child: SizedBox(
        height: size.height * .032,
        width: size.width * .08,
        child: MaterialButton(
          color: const Color.fromARGB(255, 206, 206, 206),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: AutoSizeText(
            period,
            style: TextStyle(
              fontSize: size.height * .013,
              fontWeight: FontWeight.bold,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
