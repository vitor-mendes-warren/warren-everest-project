import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:warren_task_one/shared/utils/assets.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_bar.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/bottom_nav_button.dart';
import '../helpers/setup_widget.dart';

void main() {
  group('Testing shared widgets', () {
    testWidgets(
        'WHEN button nav bar initialiazed THEN build bottom nav button  ',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          BottomNavButton(
            buttonName: faker.lorem.toString(),
            icons: warrenIcons,
            pageIndex: 0,
            route: '/',
          ));

      final image = find.byType(Image);
      final text = find.byType(Text);
      final inkwell = find.byType(InkWell);
      final column = find.byType(Column);

      expect(image, findsOneWidget);
      expect(text, findsOneWidget);
      expect(inkwell, findsOneWidget);
      expect(column, findsOneWidget);
      await tester.tap(inkwell);
    });
    testWidgets('WHEN visibility icon button tap THEN wallet balance hide ',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavBar(pageIndex: 1));

      final buttonNavButton = find.byType(BottomNavButton);

      expect(buttonNavButton, findsAtLeastNWidgets(2));
    });
  });
}
