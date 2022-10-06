import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/convert/widgets/current_coin_container.dart';
import 'package:warren_task_one/detail/widgets/convert_button.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group('Testing detail page', () {
    testWidgets(
        'WHEN current coin container initialize THEN build balance autosizetext',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
          tester,
          CurrentCoinContainer(coin: mockData.getCoinViewData()),
        );
        expect(find.byType(AutoSizeText), findsOneWidget);
      });
    });
  });
}
