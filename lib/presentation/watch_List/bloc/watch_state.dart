part of 'watch_bloc.dart';

sealed class Watchliststate {}

sealed class WatchlistActionstate extends Watchliststate {}

final class Watchlistinitial extends Watchliststate {}

final class WatchlistSuccessState extends Watchliststate {
  List<Coinmodel> watchLists;
  WatchlistSuccessState({required this.watchLists});
}

final class WatchlistRemovedMessage extends WatchlistActionstate {}
