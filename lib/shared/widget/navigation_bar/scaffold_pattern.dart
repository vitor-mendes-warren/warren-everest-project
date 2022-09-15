import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_task_one/movements/view/movements_page.dart';
import 'package:warren_task_one/portfolio/view/portfolio_page.dart';

import '../../../portfolio/provider/provider.dart';
import '../../utils/assets.dart';
import 'bottom_nav_button.dart';

class ScaffoldPatten extends StatefulHookConsumerWidget {
  const ScaffoldPatten({
    Key? key,
  }) : super(key: key);
  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScaffoldPattenState();
}

class _ScaffoldPattenState extends ConsumerState<ScaffoldPatten> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(pageIndexProvider.state);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: PageView(
          controller: pageController,
          children: const [PortfolioPage(), MovementsPage()],
          onPageChanged: (value) {
            index.state = value;
          },
        ),
        bottomNavigationBar: Container(
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
              NavButton(
                  icons: warrenIcons,
                  onTap: () {
                    index.state = 0;
                    pageController.animateToPage(
                      index.state,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  pageController: pageController),
              NavButton(
                  icons: cryptoIcons,
                  onTap: () {
                    index.state = 1;
                    pageController.animateToPage(
                      index.state,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  pageController: pageController),
            ],
          ),
        ));
  }
}
