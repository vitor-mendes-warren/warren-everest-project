import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/app_routes.dart';
import 'portfolio/view/portfolio_page.dart';
import 'package:device_preview/device_preview.dart';

//TODO retirar os cometarios
void main() {
  runApp(const MyApp());
}
// void main() {
//   runApp(DevicePreview(
//     enabled: !kReleaseMode,
//     builder: (context) => const MyApp(), // Wrap your app
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      // locale: DevicePreview.locale(context),

      // builder: DevicePreview.appBuilder,
      // useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: PortfolioPage.route,
      routes: appRoutes,
    ));
  }
}
