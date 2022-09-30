import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/detail/provider/detail_provider.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';
import '../widgets/portfolio_body.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageIndex = ref.read(pageIndexProvider.state).state;
    pageIndex = 1;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(pageIndex: 0),
      backgroundColor: Colors.white,
      body: const BodyPortfolio(),
    );
  }
}
