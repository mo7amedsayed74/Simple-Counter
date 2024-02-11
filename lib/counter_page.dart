import 'package:counter/cubit/cubit.dart';
import 'package:counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        // BlocConsumer >> اللي هتحصل (states)على التغيرات listen هو اللي بيخليني اقدر أ
        // CounterCubit  >> cubit عشان يبقى عارف هو تبع اني
        // CounterStates >> state عشان يبقى عارف هو في اني
        listener: (BuildContext context, Object? state) {
          if (state is CounterPlusState) {
            // state is object from CounterPlusState
            debugPrint('Plus State ${state.counter}');
          }
          if (state is CounterMinusState) {
            // state is object from CounterMinusState
            debugPrint('Minus State ${state.counter}');
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                'Simple Counter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).minus();
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Text(
                          '${CounterCubit.get(context).counter}',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CounterCubit.get(context).reset();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
