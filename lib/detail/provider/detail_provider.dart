import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warren_task_one/detail/controller/detail_controller.dart';

final detailControllerProvider = ChangeNotifierProvider(
  (ref) => DetailsController(),
);
