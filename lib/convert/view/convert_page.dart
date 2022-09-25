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
              color: const Color.fromARGB(255, 236, 238, 245),
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
                        color: const Color.fromARGB(255, 95, 95, 95)),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Quanto você gostaria de converter?',
                    style: TextStyle(
                      fontFamily: "Mansny regular",
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * .035,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showCoinListDialog(context);
                      },
                      icon: Icon(Icons.abc))
                ],
              ),
            ),
            const BottomLine(),
          ],
        ));
  }

  Future<dynamic> showCoinListDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 75, 75, 75),
                  blurRadius: 15,
                )
              ],
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17), topRight: Radius.circular(17))),
          height: size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.018),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 185, 186, 199),
                  ),
                  height: size.height * 0.009,
                  width: size.width * .13,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 25, horizontal: size.height * .02),
                child: Text(
                  'Escolha uma moeda para converter',
                  style: TextStyle(
                      fontFamily: "Mansny regular",
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.normal,
                      fontSize: size.height * .021,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Expanded(child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(size.height * .02),
                    height: size.height * 0.1,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color.fromARGB(255, 227, 228, 235),
                          width: 2,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'ETH',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 14,
                            )
                          ],
                        ),
                        Text(
                          'Ethereum',
                          style: TextStyle(
                              fontFamily: "Mansny-regular",
                              fontWeight: FontWeight.w300,
                              // fontWeight: FontWeight.normal,
                              fontSize: size.height * .018,
                              color: Color.fromARGB(255, 154, 154, 163)),
                        )
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
