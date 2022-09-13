import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/coin_repository.dart';
import '../../presenter/controller/wallet_controller.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => false,
);
final pageIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final walletControllerProvider = ChangeNotifierProvider(
  (ref) => WalletController(CoinRepository()),
);
