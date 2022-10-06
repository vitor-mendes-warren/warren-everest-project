import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_task_one/detail/widgets/convert_button.dart';
import 'package:warren_task_one/detail/widgets/detail_coin_value.dart';
import 'package:warren_task_one/detail/widgets/detail_header.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../helpers/mock_data.dart';
import '../helpers/setup_widget_test.dart';

void main() {
  MockData mockData = MockData();
  group('Testing detail page', () {
    testWidgets('DetailsHeader', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
          tester,
          DetailsHeader(wallet: mockData.getWalletViewData()),
        );
      });
    });
    testWidgets('Convert button tap  ', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ConvertButton(
              coin: mockData.getCoinViewData(),
              data: [],
            ));

        final button = find.byType(MaterialButton);
        expect(button, findsOneWidget);
        await tester.tap(button);
      });
    });
    testWidgets('Description coin value test', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            DetailCoinValue(
              description: faker.lorem.toString(),
              value: faker.currency.toString(),
            ));
        expect(find.byType(Text), findsAtLeastNWidgets(2));
      });
    });
  });
}
