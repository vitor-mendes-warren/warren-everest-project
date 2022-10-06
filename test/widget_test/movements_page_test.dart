import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/movements/wigdet/movement_item.dart';
import 'package:warren_task_one/movements/wigdet/movements_list.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();

  group(
    'Testing movements page',
    () {
      testWidgets(
        'WHEN  movements list request two movements THEN build two movement item  ',
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
    },
  );
}
