import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portfolio/repository/coin_repository.dart';
import '../../portfolio/presenter/controller/wallet_controller.dart';

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