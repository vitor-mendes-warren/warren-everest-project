import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../detail/widgets/bottom_line.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({Key? key}) : super(key: key);
  static const route = '/convert-page';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'Converter',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              color: Color.fromARGB(255, 236, 238, 245),
              height: size.height * .08,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saldo disponível',
                    style: TextStyle(
                        fontFamily: "Mansny regular",
                        // fontWeight: FontWeight.normal,
                        fontSize: size.height * .02,
                        color: Color.fromARGB(255, 95, 95, 95)),
                  ),
                  const AutoSizeText(
                    '0,526515 BTC',
                    maxFontSize: 25,
                    maxLines: 1,
                    minFontSize: 1,
                  ),
                ],
              ),
            ),
            const BottomLine(),
          ],
        ));
  }
}
