import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udimy_abdalla_mansour/layout/home_layout.dart';
import 'package:udimy_abdalla_mansour/shared/cubit/cubit.dart';

import 'shared/bloc_observer/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      AppCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
