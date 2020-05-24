import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

// <Event, state>
class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        throw Exception('oops');
    }
  }
}