import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState()) {
    on<CounterEvent>((event, emit) {});

    on<Decrement>((event, emit) {
      final int counter = event.counter - 1;
      emit(CounterRemoveState(updatedCounter: counter));
    });

    on<IncrementEvent>((event, emit) async {
      emit(CounterLoadingState());

      // await Future.delayed(Duration(seconds: 1));

      try {
        final int counter = event.counter + 1;

        // num a = 10 ~/ 0;

        emit(CounterLoadedState(updatedCounter: counter));
      } catch (e) {
        emit(CounterErrorState());
      }
    });
  }
}
