import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  const ConvertButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: size.width * 0.05,
          left: size.width * 0.05,
          top: size.width * 0.03,
          bottom: size.width * 0.1),
      child: MaterialButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        minWidth: size.width,
        color: const Color.fromARGB(255, 224, 43, 87),
        height: size.height * 0.08,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'Converter moeda',
          style: TextStyle(
            fontFamily: "Mansny regular",
            color: Colors.white,
            fontSize: size.height * 0.023,
          ),
        ),
      ),
    );
  }
}
