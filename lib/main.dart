import 'package:flutter/material.dart';
import 'package:counter/counter_page.dart';
import 'package:counter/cubit/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}
