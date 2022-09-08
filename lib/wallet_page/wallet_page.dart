import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Carteira',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * .05)),
                    const Text('data'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
