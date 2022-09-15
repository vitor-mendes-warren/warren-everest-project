import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/widget/navigation_bar/scaffold_pattern.dart';
import 'core/app_routes.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ScaffoldPatten(),
      // initialRoute: ScaffoldPatten.route,
      routes: appRoutes,
    ));
  }
}
