import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/shared/widget/text_page_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessBody extends HookConsumerWidget {
  const SuccessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Color.fromARGB(255, 214, 255, 223),
          radius: 35,
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: 35,
          ),
        ),
        TextPageHeader(
          title: AppLocalizations.of(context)!.successTitle,
          fontSize: 35,
        ),
        Text(
          AppLocalizations.of(context)!.successSubtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontFamily: "Mansny-light",
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
