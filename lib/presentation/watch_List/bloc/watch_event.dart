part of 'watch_bloc.dart';

sealed class Watchlistevent {}

final class WatchlistremovedEvent extends Watchlistevent {
  final int index;

  WatchlistremovedEvent({required this.index});
}

final class WatchlistsuccessLoadedEvent extends Watchlistevent {}
