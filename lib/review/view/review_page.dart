import 'package:flutter/material.dart';
import '../widget/review_body.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  static const route = '/review-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Revisar',
          style: TextStyle(
            fontFamily: "Mansny-regular",
          ),
        ),
      ),
      body: const BodyReview(),
    );
  }
}
