import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_task_one/shared/widget/text_page_header.dart';

import '../../shared/widget/navigation_bar/bottom_nav_bar.dart';
import '../model/movement_model.dart';
import '../provider/movement_provider.dart';
import '../wigdet/movements_empty_body.dart';
import '../wigdet/movements_list.dart';

class MovementsPage extends HookConsumerWidget {
  static const route = '/movements-page';
  const MovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
        bottomNavigationBar: BottomNavBar(pageIndex: 1),
        body: SafeArea(
          child: MovementBody(),
        ));
  }
}

class MovementBody extends HookConsumerWidget {
  const MovementBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movementControler = ref.watch(movementControllerProvider);
    List<MovementModel> allMovements = movementControler.getAllMoviments();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.04),
            child: TextPageHeader(
                title: 'Movimentações', fontSize: size.height * .045),
          ),
          Expanded(
            child: Visibility(
              visible: allMovements.isNotEmpty,
              replacement: const MovimentsEmptyBody(),
              child: MovementsList(allMovements: allMovements),
            ),
          )
        ],
      ),
    );
  }
}
