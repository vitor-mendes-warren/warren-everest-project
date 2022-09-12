import 'package:flutter/material.dart';
import 'package:warren_task_one/home_page/widgets/crypto_item.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const CryptoItem();
        },
      ),
    );
  }
}
