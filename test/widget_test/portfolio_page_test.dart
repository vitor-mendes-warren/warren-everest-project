import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:warren_task_one/detail/view/detail_page.dart';
import 'package:warren_task_one/portfolio/widgets/coin_item.dart';
import 'package:warren_task_one/portfolio/widgets/coin_title.dart';
import 'package:warren_task_one/portfolio/widgets/success_loading_body.dart';
import 'package:warren_task_one/portfolio/widgets/wallet_balance.dart';
import 'package:warren_task_one/portfolio/widgets/wallet_header.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_bar.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_button.dart';
import '../helpers/mock_data.dart';
import '../helpers/setup_widget_test.dart';

void main() {
  MockData mockData = MockData();
  group('Testing portifolio page', () {
    // testWidgets('description', (widgetTester) => null)

    testWidgets('Visibility icon test', (WidgetTester tester) async {
      await loadPage(tester, const CoinTitle());
      final visibilityIconData = find.byIcon(Icons.visibility_off);

      expect(find.text('Crypto'), findsOneWidget);
      expect(visibilityIconData, findsOneWidget);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(visibilityIconData, findsNothing);
    });
    testWidgets('Wallet header test', (WidgetTester tester) async {
      await loadPage(tester, const WalletHeader());

      expect(find.text('Total balance'), findsOneWidget);
      expect(find.byType(CoinTitle), findsOneWidget);
      expect(find.byType(WalletBalance), findsOneWidget);
    });
    testWidgets('Walletbalance visibility test  ', (WidgetTester tester) async {
      await loadPage(tester, const SuccessLoadingBody());
      final totalBalance = find.byType(AutoSizeText);

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(totalBalance, findsNothing);
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(totalBalance, findsOneWidget);
    });
  });
  testWidgets('BottomNavBar click test  ', (WidgetTester tester) async {
    await loadPage(
        tester,
        const BottomNavBar(
          pageIndex: 1,
        ));

    expect(find.byType(BottomNavButton), findsAtLeastNWidgets(2));

    final inkwel = find.byType(InkWell);
    await tester.tap(inkwel.first);
    await tester.pumpAndSettle();
    await tester.tap(inkwel.first);
    await tester.pumpAndSettle();
  });
  testWidgets('CoinItem click navigation Test ', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await loadPage(tester, CoinItem(wallet: mockData.getWalletViewData()));

      final gesture = find.byType(GestureDetector);
      expect(gesture, findsOneWidget);
      await tester.tap(gesture);
      await tester.pumpAndSettle();

      expect(find.byType(DetailsPage), findsOneWidget);
    });
  });
}
