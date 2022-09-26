import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/convert_controller.dart';

final allCoinsControllerProvider =
    ChangeNotifierProvider((ref) => AllCoinsController());
