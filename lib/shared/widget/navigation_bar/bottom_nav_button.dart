import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../portfolio/provider/provider.dart';

class NavButton extends HookConsumerWidget {
  const NavButton({
    super.key,
    required this.pageController,
    required this.onTap,
    required this.icons,
  });
  final PageController pageController;
  final Function onTap;
  final Set<String> icons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final index = ref.watch(pageIndexProvider.state);
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              height: size.height * 0.03,
              image: AssetImage(icons.elementAt(index.state)),
              fit: BoxFit.cover,
            ),
            Text(
              icons.elementAt(2),
              style: TextStyle(fontSize: size.width * 0.03),
            )
          ],
        ),
      ),
    );
  }
}
