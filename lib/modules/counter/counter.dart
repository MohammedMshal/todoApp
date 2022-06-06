import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udimy_abdalla_mansour/modules/counter/cubit/cubit.dart';
import 'package:udimy_abdalla_mansour/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPluseState) debugPrint('Plus ${state.counter}');
          if (state is CounterMinusState) debugPrint('Mins ${state.counter}');
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(title: const Text('Counter')),
          body: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  CounterCubit.get(context).minus();
                },
                child: const Text('-',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 20),
              Text('${CounterCubit.get(context).counter} ',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold)),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  CounterCubit.get(context).pluse();
                },
                child: const Text('+',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
