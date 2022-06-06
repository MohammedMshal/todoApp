abstract class CounterStates {}

class CounterInitailState extends CounterStates {}

class CounterPluseState extends CounterStates {
  // ignore: prefer_typing_uninitialized_variables
  final counter;

  CounterPluseState(this.counter);
}

class CounterMinusState extends CounterStates {
  // ignore: prefer_typing_uninitialized_variables
  final counter;
  CounterMinusState(this.counter);
}
