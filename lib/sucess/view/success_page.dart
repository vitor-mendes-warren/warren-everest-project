import 'package:flutter/material.dart';
import '../widget/success_page.dart';

class SucessPage extends StatelessWidget {
  const SucessPage({super.key});

  static const route = '/sucess-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const SuccessBody(),
    );
  }
}
