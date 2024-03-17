import 'package:bloc/bloc.dart';
import 'package:cryptofy/data/model/model_class.dart';
import 'package:cryptofy/data/watchedlist/watchlist.dart';

part 'watch_event.dart';
part 'watch_state.dart';

class Watchlistbloc extends Bloc<Watchlistevent, Watchliststate> {
  Watchlistbloc() : super(Watchlistinitial()) {
    on<WatchlistsuccessLoadedEvent>(watchlistsuccessloadedevent);
    on<WatchlistremovedEvent>(watchlistremovedevent);
  }
  watchlistsuccessloadedevent(
      WatchlistsuccessLoadedEvent event, Emitter<Watchliststate> emit) async {
    emit(WatchlistSuccessState(watchLists: watchList));
  }

  watchlistremovedevent(
      WatchlistremovedEvent event, Emitter<Watchliststate> emit) async {
    try {
      int index = event.index;
      watchList.removeAt(index);
      emit(WatchlistRemovedMessage());
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
