import 'package:cryptofy/presentation/coin_List/bloc/coin_bloc.dart';
import 'package:cryptofy/presentation/home/home_screen.dart';
import 'package:cryptofy/presentation/watch_List/bloc/watch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Coinbloc(),
          ),
          BlocProvider(
            create: (context) => Watchlistbloc(),
            child: Container(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ));
  }
}
