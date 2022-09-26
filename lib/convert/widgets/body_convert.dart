import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../detail/widgets/bottom_line.dart';
import 'bottom_coin__list.dart';

class BodyConvert extends StatefulHookConsumerWidget {
  const BodyConvert({
    super.key,
  });

  @override
  BodyConvertState createState() => BodyConvertState();
}

class BodyConvertState extends ConsumerState<BodyConvert>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
                    wshowModalBottomSheet<void>(
                      // transitionAnimationController: ,
                      useSafeArea: true,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      context: context,
                      builder: (BuildContext context) {
                        return const BottomCoinList();
                      },
                    );
                  },
                  icon: const Icon(Icons.abc))
            ],
          ),
        ),
        const BottomLine(),
      ],
    );
  }
}
