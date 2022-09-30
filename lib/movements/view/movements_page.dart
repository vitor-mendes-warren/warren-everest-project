import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';

class MovementsPage extends StatelessWidget {
  static const route = '/movements-page';
  const MovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(pageIndex: 1),
        body: Center(
            child: AutoSizeText(
          maxLines: 1,
          ' página de movimentações',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Montserrat",
            fontSize: 50,
          ),
        )));
  }
}
