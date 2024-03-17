import 'package:cryptofy/presentation/coin_List/ui_widgets/coin_list_page.dart';
import 'package:cryptofy/presentation/watch_List/ui_widgets/watchlist_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 12, 11, 35),
        appBar: AppBar(
          leading: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
          ),
          backgroundColor: const Color.fromARGB(255, 12, 11, 35),
          title: const Text(
            'Cryptofys',
            style: TextStyle(color: Colors.white),
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
          centerTitle: true,
        ),
        body: const SafeArea(
            child: Column(
          children: [
            TabBar(
                indicatorColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                tabs: [
                  Tab(
                    text: 'Cryptocurrency',
                  ),
                  Tab(
                    text: 'Watchlist',
                  )
                ]),
            Expanded(
                child: TabBarView(children: [Coinlistpage(), Watchlistpage()]))
          ],
        )),
      ),
    );
  }
}
