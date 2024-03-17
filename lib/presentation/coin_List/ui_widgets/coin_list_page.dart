import 'package:cryptofy/presentation/coin_List/bloc/coin_bloc.dart';
import 'package:cryptofy/presentation/coin_List/ui_widgets/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Coinlistpage extends StatefulWidget {
  const Coinlistpage({super.key});

  @override
  State<Coinlistpage> createState() => _CoinlistpageState();
}

class _CoinlistpageState extends State<Coinlistpage> {
  @override
  void initState() {
    context.read<Coinbloc>().add(CoinfetchsuccessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<Coinbloc, Coinstate>(
          listenWhen: (previous, current) => current is Coinactionstate,
          buildWhen: (previous, current) => current is! Coinactionstate,
          listener: (context, state) {
            if (state is CoinWatchListAddedMessageState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: Color.fromARGB(255, 1, 198, 106),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(10),
                  content: Text(
                    'Added to Wishlist',
                  )));
            }
          },
          builder: (context, state) {
            if (state is CoinSuccessState) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.cryptoList.length,
                itemBuilder: (context, index) {
                  return Coinwidget(
                    cryptoCoin: state.cryptoList[index],
                  );
                },
              );
            }
            if (state is CoinLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CoinErrorState) {
              return const Center(
                child: Text(
                  'Error Occured Fetchind Data',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
