import 'package:cryptofy/data/model/model_class.dart';
import 'package:cryptofy/presentation/coin_List/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coinwidget extends StatelessWidget {
  const Coinwidget({
    super.key,
    required this.cryptoCoin,
  });
  final Coinmodel cryptoCoin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3.5),
      decoration: BoxDecoration(
          color: cryptoCoin.priceChange24H! < 0
              ? const Color.fromARGB(60, 83, 49, 49)
              : const Color.fromARGB(86, 81, 122, 83),
          borderRadius: BorderRadius.circular(5)),
      height: 57,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                      child: Text(
                        cryptoCoin.marketCapRank.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ),
                  ),
                )),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(cryptoCoin.image))),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        child: Text(
                          cryptoCoin.symbol.toUpperCase(),
                          maxLines: 1,
                          overflow: null,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 11),
                        ),
                      )
                    ],
                  ),
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  // height: 80,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Row(
                      children: [
                        Text(
                          "\$ ${cryptoCoin.currentPrice}",
                          maxLines: 1,
                          overflow: null,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          cryptoCoin.priceChange24H!.toStringAsFixed(2),
                          maxLines: 1,
                          overflow: null,
                          style: TextStyle(
                              color: cryptoCoin.priceChange24H! < 0
                                  ? const Color.fromARGB(255, 255, 0, 0)
                                  : Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  // child: ListTile(
                )),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const SizedBox(
                      //   height: 3,
                      // ),
                      // Text(
                      //   cryptoCoin.priceChange24H!.toStringAsFixed(2),
                      //   maxLines: 1,
                      //   overflow: null,
                      //   style: TextStyle(
                      //       color: cryptoCoin.priceChange24H! < 0
                      //           ? const Color.fromARGB(255, 255, 0, 0)
                      //           : Colors.green,
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 13),
                      // ),
                      // const SizedBox(
                      //   height: 3,
                      // ),
                      InkWell(
                        onTap: () {
                          context.read<Coinbloc>().add(
                              CoinwatchlistaddedEvent(cryptobj: cryptoCoin));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            ),
                            Text(
                              '  Watchlist',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
