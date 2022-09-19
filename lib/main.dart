import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'portfolio/view/portfolio_page.dart';
import 'core/app_routes.dart';

// void main() {
//   runApp(DevicePreview(builder: (context) => const MyApp()));
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: PortfolioPage.route,
      routes: appRoutes,
    ));
  }
}
