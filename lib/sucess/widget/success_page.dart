import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:warren_task_one/sucess/widget/slide_fade_transition.dart';

class SuccessBody extends HookConsumerWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SlideFadeTransition(
          curve: Curves.elasticOut,
          delayStart: const Duration(milliseconds: 100),
          animationDuration: const Duration(milliseconds: 2500),
          offset: -3.0,
          direction: Direction.vertical,
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 214, 255, 223),
                  radius: 35,
                  child: Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 35,
                  ),
                ),
                TextPageHeader(
                  title: 'Conversao efetuada',
                  fontSize: 35,
                ),
                Text(
                  'Conversao de moeda efetuada com sucesso!',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Mansny-light",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
