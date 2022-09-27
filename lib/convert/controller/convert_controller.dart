import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../portfolio/model/coin_view_data.dart';
import '../../portfolio/model/wallet_view_data.dart';

class ConvertController extends ChangeNotifier {
  late bool isValidConversion;

  late Decimal _coinPercent;
  late Decimal _convertValue;

  late double currentAssetPrice;
  late double currentAssetPriceToConvert;
  late CoinViewData coinToConvert;
  late CoinViewData currentCoin;

  void refreshVar(CoinViewData coinToConvert, CoinViewData currentCoin,
      WalletViewData userWallet) {
    this.currentCoin = currentCoin;
    this.coinToConvert = coinToConvert;
    currentAssetPriceToConvert = coinToConvert.market_data!.current_price.usd;
    currentAssetPrice = currentCoin.market_data!.current_price.usd;
    _setCoinPercent(userWallet.percent.toString());
    isValidConversion =
        (currentCoin != coinToConvert) && (_coinPercent >= _convertValue);
    if (currentCoin == coinToConvert) {
      helperMessage = 'Selecione uma moeda diferente para conversão';
    }
  }

  late String helperMessage;
  ConvertController() {
    _coinPercent = Decimal.fromInt(0);
    _convertValue = Decimal.fromInt(0);
    isValidConversion = true;
  }

  void _validateConversion() {
    if (_convertValue == Decimal.fromInt(0)) {
      isValidConversion = false;
      helperMessage = 'Digite um valor válido';
    } else if (_coinPercent < _convertValue) {
      helperMessage = 'Valor digitado superior ao saldo disponível';
    }
    notifyListeners();
  }

  void setConvertValue(String convertValue) {
    if (convertValue.isNotEmpty) {
      _convertValue = Decimal.parse(convertValue);
    } else {
      _convertValue = Decimal.fromInt(0);
    }
    _validateConversion();
  }

  void _setCoinPercent(String convertValue) {
    _coinPercent = Decimal.parse(convertValue);
  }

  String getDolarFormatedValue() {
    return NumberFormat.simpleCurrency(name: 'US\$ ', decimalDigits: 2).format(
        DecimalIntl(Decimal.parse(
            (currentAssetPrice * _convertValue.toDouble()).toString())));
  }

  String getConvertValue() {
    Decimal dolarValue = Decimal.parse(
        (currentAssetPrice * _convertValue.toDouble()).toString());

    return '${coinToConvert.symbol} ${(dolarValue.toDouble() / currentAssetPriceToConvert).toString()}';
  }
}
