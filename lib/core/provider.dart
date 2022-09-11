import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => false,
);
final pageIndexProvider = StateProvider<int>(
  (ref) => 0,
);
