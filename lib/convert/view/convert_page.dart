import 'package:flutter/material.dart';

import '../widgets/body_convert.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(
            AppLocalizations.of(context)!.convert,
          ),
        ),
        body: const BodyConvert());
  }
}
