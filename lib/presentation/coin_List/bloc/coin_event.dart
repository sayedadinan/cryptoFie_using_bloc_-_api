part of 'coin_bloc.dart';

sealed class Coinevent {}

class CoinfetchsuccessEvent extends Coinevent {}

class CoinwatchlistaddedEvent extends Coinevent {
  late Coinmodel cryptobj;
  CoinwatchlistaddedEvent({required this.cryptobj});
}
