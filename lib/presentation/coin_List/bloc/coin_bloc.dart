import 'package:bloc/bloc.dart';
import 'package:cryptofy/data/model/model_class.dart';
import 'package:cryptofy/data/repositery/crypto_repositery.dart';
import 'package:cryptofy/data/watchedlist/watchlist.dart';
part 'coin_event.dart';
part 'coin_state.dart';

class Coinbloc extends Bloc<Coinevent, Coinstate> {
  Coinbloc() : super(CoinInitial()) {
    on<CoinfetchsuccessEvent>(coinfetchsuccessevent);
    on<CoinwatchlistaddedEvent>(coinwatchaddedevent);
  }
  coinfetchsuccessevent(
      CoinfetchsuccessEvent event, Emitter<Coinstate> emit) async {
    emit(CoinLoadingState());

    try {
      final cryptocoin = await CryptoApi().fetchData();
      if (cryptocoin.isNotEmpty) {
        emit(CoinSuccessState(cryptoList: cryptocoin));
      } else {
        emit(CoinErrorState(error: 'error in data ferching area'));
      }
    } catch (e) {
      emit(CoinErrorState(error: 'error in data fetching $e'));
    }
  }

  coinwatchaddedevent(
      CoinwatchlistaddedEvent event, Emitter<Coinstate> emit) async {
    watchList.add(event.cryptobj);
    emit(CoinWatchListAddedMessageState());
  }
}
