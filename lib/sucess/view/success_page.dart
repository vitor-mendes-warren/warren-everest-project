import 'package:flutter/material.dart';
import '../widget/slide_fade_transition.dart';
import '../widget/success_body.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

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
      body: const Center(
        child: SlideFadeTransition(
            curve: Curves.elasticOut,
            delayStart: Duration(milliseconds: 100),
            animationDuration: Duration(milliseconds: 2500),
            offset: -3.0,
            direction: Direction.vertical,
            child: SizedBox(height: 150, child: SuccessBody())),
      ),
    );
  }
}
