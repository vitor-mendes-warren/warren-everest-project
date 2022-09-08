import 'dart:js';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:warren_task_one/wallet_page/wallet_page.dart';

void main() {
  runApp(DevicePreview(builder: (context) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const WalletPage(),
    );
  }
}
