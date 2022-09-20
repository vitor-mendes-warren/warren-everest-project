import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/detail_controller.dart';

final detailControllerProvider = ChangeNotifierProvider(
  (ref) => DetailsController(),
);
