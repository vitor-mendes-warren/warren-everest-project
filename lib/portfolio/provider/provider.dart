import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/wallet_controller.dart';
import '../repository/coin_repository.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => false,
);
final pageIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final walletControllerProvider = ChangeNotifierProvider(
  (ref) => WalletController(CoinRepository()),
  //teste
);
