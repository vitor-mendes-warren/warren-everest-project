import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:warren_task_one/core/app_routes.dart';
import 'package:warren_task_one/movements/controller/movement_controler.dart';
import 'package:warren_task_one/movements/provider/movement_provider.dart';
import 'package:warren_task_one/movements/repository/movement_repository.dart';

import 'mock_data.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;

  SetupWidgetTester({
    Key? key,
    required this.child,
  }) : super(key: key);

  late MockData mockData = MockData();
  @override
  Widget build(BuildContext context) {
    final movementControllerProviderMock = ChangeNotifierProvider(
        (ref) => MovementControler(MovementRepository()));
    return ProviderScope(
        overrides: [
          // convertControllerProvider
          //     .overrideWithProvider(convertControllerProviderMock),
          movementControllerProvider
              .overrideWithProvider(movementControllerProvider)
        ],
        child: MaterialApp(
          routes: appRoutes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Material(
            child: MediaQuery(
              data: const MediaQueryData(),
              child: child,
            ),
          ),
        ));
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
