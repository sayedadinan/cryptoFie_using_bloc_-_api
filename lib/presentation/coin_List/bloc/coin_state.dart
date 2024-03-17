part of 'coin_bloc.dart';

sealed class Coinstate {}

sealed class Coinactionstate extends Coinstate {}

final class CoinInitial extends Coinstate {}

final class CoinLoadingState extends Coinstate {}

final class CoinSuccessState extends Coinstate {
  List<Coinmodel> cryptoList = [];
  CoinSuccessState({required this.cryptoList});
}

final class CoinErrorState extends Coinstate {
  final String error;

  CoinErrorState({required this.error});
}

final class CoinWatchListAddedMessageState extends Coinactionstate {}
