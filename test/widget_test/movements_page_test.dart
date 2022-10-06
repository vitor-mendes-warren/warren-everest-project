import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/movements/wigdet/movement_item.dart';
import 'package:warren_task_one/movements/wigdet/movements_list.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget_test.dart';

void main() {
  MockData mockData = MockData();

  group(
    'Testing movements page',
    () {
      testWidgets(
        'MovementsList item test ',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                MovementsList(
                  movementsList: mockData.getMovementList(),
                ),
              );
              expect(find.byType(MovementItem), findsAtLeastNWidgets(2));
            },
          );
        },
      );
      testWidgets(
        'MovementsList item test ',
        (WidgetTester tester) async {
          mockNetworkImagesFor(
            () async {
              await loadPage(
                tester,
                MovementsList(
                  movementsList: mockData.getMovementList(),
                ),
              );

              final movementItem = find.byType(MovementItem);
              final gestureDetector = find.byType(GestureDetector);

              expect(movementItem, findsAtLeastNWidgets(2));
              expect(gestureDetector, findsAtLeastNWidgets(2));
              await tester.tap(gestureDetector.first, warnIfMissed: false);
              await tester.pumpAndSettle();
            },
          );
        },
      );
    },
  );
}
