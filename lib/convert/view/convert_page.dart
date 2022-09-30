import 'package:flutter/material.dart';

import '../widgets/body_convert.dart';

class ConvertPage extends StatelessWidget {
  const ConvertPage({Key? key}) : super(key: key);
  static const route = '/convert-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'Converter',
          ),
        ),
        body: const BodyConvert());
  }
}
