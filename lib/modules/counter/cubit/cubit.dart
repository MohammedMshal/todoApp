import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udimy_abdalla_mansour/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitailState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 1;

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }

  void pluse() {
    counter++;
    emit(CounterPluseState(counter));
  }
}
