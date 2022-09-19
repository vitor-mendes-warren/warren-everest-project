import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:warren_task_one/shared/utils/util.dart';

class CurrencyVariationValue extends StatelessWidget {
  const CurrencyVariationValue({
    Key? key,
    required this.description,
    required this.value,
  }) : super(key: key);
  final String description;
  final String value;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 1,
          ),
        ),
      ),
      margin: EdgeInsets.only(left: size.width * 0.05),
      height: size.height * .07,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              description,
              style: TextStyle(
                fontFamily: "Mansny-regular",
                color: const Color.fromARGB(255, 117, 118, 128),
                fontSize: size.height * .021,
              ),
            ),
            AutoSizeText(
                maxLines: 1,
                value,
                style: TextStyle(
                  fontFamily: "Mansny-regular",
                  color: Util.getVariationColor(value),
                  fontSize: size.height * .020,
                ))
          ],
        ),
      ),
    );
  }
}
