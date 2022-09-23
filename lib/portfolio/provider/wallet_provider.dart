import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/coin_view_data.dart';
import '../usecase/get_all_coin_use_case.dart';

import '../../shared/repository/coin_repository_provider.dart';
import '../controller/wallet_controller.dart';

final viewWalletValueProvider = StateProvider<bool>(
  (ref) => false,
);
final pageIndexProvider = StateProvider<int>(
  (ref) => 0,
);

final walletControllerProvider =
    ChangeNotifierProvider((ref) => WalletController());

final getAllCoinUseCase = Provider((ref) {
  return GetAllCoinUseCase(repository: ref.read(coinRepositoryProvider));
});

final allCoinsProvider = FutureProvider<List<CoinViewData>>((ref) async {
  return ref.read(getAllCoinUseCase).execute();
});
