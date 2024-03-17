import 'package:cryptofy/data/model/model_class.dart';
import 'package:cryptofy/presentation/watch_List/bloc/watch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistCard extends StatelessWidget {
  const WatchlistCard({
    super.key,
    required this.cryptoCoin,
    required this.index,
  });
  final Coinmodel cryptoCoin;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      decoration: BoxDecoration(
          color: cryptoCoin.priceChange24H! < 0
              ? Color.fromARGB(62, 92, 71, 71)
              : const Color.fromARGB(88, 76, 175, 79),
          borderRadius: BorderRadius.circular(5)),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.black,
                      child: Text(
                        cryptoCoin.marketCapRank.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(cryptoCoin.image))),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                        child: Text(
                          cryptoCoin.symbol.toUpperCase(),
                          maxLines: 1,
                          overflow: null,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    height: 130,
                    alignment: Alignment.topCenter,
                    child: ListTile(
                      title: Text(
                        cryptoCoin.name,
                        maxLines: 1,
                        overflow: null,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "\$ ${cryptoCoin.currentPrice}",
                          maxLines: 1,
                          overflow: null,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 3,
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
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<Watchlistbloc>()
                              .add(WatchlistremovedEvent(index: index));
                          context
                              .read<Watchlistbloc>()
                              .add(WatchlistsuccessLoadedEvent());
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.remove,
                              color: Color.fromARGB(255, 255, 102, 102),
                              size: 15,
                            ),
                            Text(
                              '  Remove',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 255, 113, 113),
                              ),
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
