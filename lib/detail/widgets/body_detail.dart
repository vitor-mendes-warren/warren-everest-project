import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../portfolio/model/wallet_view_data.dart';
import '../../portfolio/widgets/loading_wallet.dart';
import '../../shared/api/models/coin_prices/coin_price_response.dart';
import '../../shared/utils/util.dart';
import '../provider/detail_provider.dart';
import 'coin_price.dart';
import 'coin_ticker.dart';
import 'coin_title_detail.dart';
import 'detail_chart.dart';
import 'detail_description.dart';
import 'detail_header.dart';

class BodyDetail extends StatefulHookConsumerWidget {
  const BodyDetail({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  final WalletViewData wallet;
  @override
  BodyDetailState createState() => BodyDetailState();
}

class BodyDetailState extends ConsumerState<BodyDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final coinHistoryPriceProvider = ref.read(coinHistoryPricesProvider);
    final detailController = ref.watch(detailControllerProvider);
    return SafeArea(
        child: coinHistoryPriceProvider.when(data: (data) {
      detailController
          .setCoinHistoryPriceValues(data as List<CoinValueResponse>);
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailsHeader(wallet: widget.wallet),
          DetailChart(wallet: widget.wallet),
          DetailDescription(data: data, wallet: widget.wallet)
        ],
      );
    }, error: (error, stackTrace) {
      return SingleChildScrollView(child: Text(stackTrace.toString()));
    }, loading: () {
      Timer(const Duration(seconds: 1), () {
        setState(() {});
      });
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 27, horizontal: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(7)),
                            height: size.height * .06,
                            width: size.width,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * .005),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(7)),
                              height: size.height * .03,
                              width: size.width * .1,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(7)),
                            height: size.height * .06,
                            width: size.width * .6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(7)),
                              height: size.height * .2,
                              width: size.width,
                            ),
                          ),
                        ]),
                  ),
                ],
              )),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => Container(
              height: size.height * .12,
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color.fromARGB(255, 227, 228, 235),
                    width: 2,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .03, vertical: size.height * .02),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: size.width * .12,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.amber,
                                  ),
                                  height: 10,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  height: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * .009, left: size.width * .04),
                          child: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ))
        ],
      );
      ;
    }));
  }
}
