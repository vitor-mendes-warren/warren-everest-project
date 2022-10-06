import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_task_one/detail/widgets/coin_price.dart';
import 'package:warren_task_one/detail/widgets/coin_ticker.dart';
import 'package:warren_task_one/detail/widgets/coin_title_detail.dart';
import 'package:warren_task_one/detail/widgets/detail_coin_value.dart';
import 'package:warren_task_one/detail/widgets/detail_header.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../helpers/mock_data.dart';
import '../helpers/setup_widget.dart';

void main() {
  MockData mockData = MockData();
  group('Testing detail page', () {
    testWidgets('WHEN details page teste THEN build header widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
          tester,
          DetailsHeader(wallet: mockData.getWalletViewData()),
        );
        expect(find.byType(CoinTitleDetail), findsOneWidget);
        expect(find.byType(CoinTicker), findsOneWidget);
        expect(find.byType(CoinPrice), findsOneWidget);
      });
    });
    testWidgets('WHEN detail coin initialize THEN build two texts ',
        (WidgetTester tester) async {
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
