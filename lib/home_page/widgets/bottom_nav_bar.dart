import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/core/provider.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final pageIndex = ref.watch(pageIndexProvider.state);
    return Container(
      height: size.height * .08,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 227, 228, 235),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              pageIndex.state = 0;
            },
            child: SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    height: size.height * 0.03,
                    image: AssetImage((pageIndex.state == 1)
                        ? 'assets/image/warren_icon_white.png'
                        : 'assets/image/warren_icon_pink.png'),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Portfólio',
                    style: TextStyle(fontSize: size.width * 0.03),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              pageIndex.state = 1;
            },
            child: SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    height: size.height * 0.03,
                    image: AssetImage((pageIndex.state == 1)
                        ? 'assets/image/crypto_icon_pink.png'
                        : 'assets/image/crypto_icon_white.png'),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Movimentações',
                    style: TextStyle(fontSize: size.width * 0.03),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
