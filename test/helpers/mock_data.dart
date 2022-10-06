// import 'package:everest_flutter_crypto_tests/modules/details/model/crypto_data_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/exchange/model/exchange_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/review/model/review_arguments.dart';
// import 'package:everest_flutter_crypto_tests/modules/transactions/model/transactions_model.dart';
// import 'package:everest_flutter_crypto_tests/modules/wallet/model/crypto_data_view_data.dart';
import 'package:decimal/decimal.dart';
import 'package:faker/faker.dart';
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
          dolarValue: 'qsqsdqwd'),
      MovementModel(
          coinEntry: getCoinViewData(),
          coinOut: getCoinViewData(),
          movementEntry: Decimal.parse('1212312'),
          movementOut: Decimal.parse('123123123'),
          movementDate: '2020/10/12',
          dolarValue: 'qsqsdqwd'),
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
  // CryptoDataViewData createCryptoViewData() {
  //   CryptoDataViewData repo = CryptoDataViewData(
  //     id: faker.guid.guid(),
  //     symbol: faker.guid.guid(),
  //     name: faker.guid.guid(),
  //     image: faker.internet.httpUrl(),
  //     current_price: faker.currency.random.decimal(scale: 15, min: 1),
  //     market_cap_change_percentage_24h:
  //         faker.currency.random.decimal(scale: 15, min: 1),
  //   );
  //   return repo;
  // }

  // CryptoDataArguments createCryptoDataArguments() {
  //   CryptoDataArguments repo = CryptoDataArguments(
  //     crypto: createCryptoViewData(),
  //     cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
  //     cryptoValue: faker.currency.random.decimal(scale: 15, min: 1),
  //   );
  //   return repo;
  // }

  // ExchangeArguments createExchangeArguments() {
  //   ExchangeArguments repo = ExchangeArguments(
  //       crypto: createCryptoViewData(),
  //       cryptoBalance: faker.currency.random.decimal(scale: 15, min: 1),
  //       cryptoValue: faker.currency.random.decimal(scale: 15, min: 1));
  //   return repo;
  // }

  // ReviewArguments createReviewArguments() {
  //   ReviewArguments repo = ReviewArguments(
  //     cryptoToExchangeValue: faker.currency.random.decimal(scale: 15, min: 1),
  //     cryptoToExchangeData: createCryptoViewData(),
  //     cryptoBeingExchangedValue:
  //         faker.currency.random.decimal(scale: 15, min: 1),
  //     cryptoBeingExchangeData: createCryptoViewData(),
  //   );
  //   return repo;
  // }

  // TransactionsModel createTransactionModel() {
  //   TransactionsModel repo = TransactionsModel(
  //       cryptoBeingExchangedInfo: faker.guid.guid(),
  //       cryptoToExchangeInfo: faker.guid.guid(),
  //       moneyBeingExchangedInfo: faker.guid.guid(),
  //       exchangeEqualsTo: faker.guid.guid(),
  //       date: faker.date.dateTime());
  //   return repo;
  // }
}
