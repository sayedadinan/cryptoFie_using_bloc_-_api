import 'package:cryptofy/presentation/watch_List/bloc/watch_bloc.dart';
import 'package:cryptofy/presentation/watch_List/ui_widgets/watchlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Watchlistpage extends StatefulWidget {
  const Watchlistpage({super.key});

  @override
  State<Watchlistpage> createState() => _WatchlistpageState();
}

class _WatchlistpageState extends State<Watchlistpage> {
  @override
  void initState() {
    context.read<Watchlistbloc>().add(WatchlistsuccessLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<Watchlistbloc, Watchliststate>(
          buildWhen: (previous, current) => current is WatchlistActionstate,
          listenWhen: (previous, current) => current is! WatchlistActionstate,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WatchlistSuccessState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.watchLists.length,
                itemBuilder: (context, index) {
                  return WatchlistCard(
                    cryptoCoin: state.watchLists[index],
                    index: index,
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
