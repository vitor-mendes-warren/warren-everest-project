// import 'package:everest_flutter_crypto_tests/modules/details/model/crypto_data_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
import 'package:warren_task_one/detail/controller/detail_controller.dart';
import 'package:warren_task_one/movements/model/movement_model.dart';
import 'package:warren_task_one/portfolio/model/coin_view_data.dart';
import 'package:warren_task_one/portfolio/model/wallet_view_data.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_image_response.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_market_data_current_price.dart';
import 'package:warren_task_one/shared/api/models/coin/coin_result_market_data_response.dart';

class MockData {
  WalletViewData getWalletViewData() {
    return WalletViewData(
        userBalance: Decimal.fromInt(6546545),
        coin: CoinViewData(
            id: faker.guid.guid(),
            symbol: faker.guid.guid(),
            name: faker.guid.guid(),
            image: CoinResultImageResponse('thumb', 'small', 'large'),
            market_data: CoinResultMarketDataResponse(
                CoinResultMarketDataCurrentPrice(123123), 123123)));
  }

  List<MovementModel> getMovementList() {
    return [
      MovementModel(
          coinEntry: getCoinViewData(),
          coinOut: getCoinViewData(),
          movementEntry: Decimal.parse('1212312'),
          movementOut: Decimal.parse('123123123'),
          movementDate: '2020/10/12',
          dolarValue: faker.lorem.toString()),
      MovementModel(
          coinEntry: getCoinViewData(),
          coinOut: getCoinViewData(),
          movementEntry: Decimal.parse('1212312'),
          movementOut: Decimal.parse('123123123'),
          movementDate: '2020/10/12',
          dolarValue: faker.lorem.toString()),
    ];
  }

  CoinViewData getCoinViewData() {
    return CoinViewData(
        id: faker.guid.guid(),
        symbol: faker.guid.guid(),
        name: faker.guid.guid(),
        image: CoinResultImageResponse('thumb', 'small', 'large'),
        market_data: CoinResultMarketDataResponse(
            CoinResultMarketDataCurrentPrice(123123), 123123));
  }

  DetailsController getDetailsController() {
    return DetailsController();
  }
}
