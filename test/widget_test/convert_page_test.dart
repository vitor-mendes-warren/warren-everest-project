import 'package:auto_size_text/auto_size_text.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/convert/view/convert_page.dart';
import 'package:warren_task_one/convert/widgets/current_coin_container.dart';
import 'package:warren_task_one/detail/widgets/convert_button.dart';
import 'package:warren_task_one/detail/widgets/currency_variation_value.dart';

import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group('Testing detail page', () {
    testWidgets(
        'WHEN current coin container initialize THEN build coin container layout ',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
          tester,
          CurrentCoinContainer(coin: mockData.getCoinViewData()),
        );
        expect(find.byType(AutoSizeText), findsOneWidget);
        expect(find.byType(Container), findsAtLeastNWidgets(2));
        expect(find.byType(Row), findsOneWidget);
        expect(find.byType(BoxDecoration), findsNothing);
      });
    });
    testWidgets(
        'WHEN convert button initialize THEN build convert button components',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester, ConvertButton(coin: mockData.getCoinViewData(), data: []));
        expect(find.byType(MaterialButton), findsOneWidget);
        expect(find.byType(Padding), findsWidgets);
        expect(find.byType(Text), findsWidgets);
        await tester.press(find.byType(MaterialButton));
        await tester.pumpAndSettle();
        expect(find.byType(ConvertPage), findsNothing);
      });
    });
    testWidgets(
        'WHEN  currency variation value initialize THEN build convert button components',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            CurrencyVariationValue(
              description: faker.lorem.toString(),
              value: faker.lorem.toString(),
            ));
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(AutoSizeText), findsWidgets);
      });
    });
  });
}
