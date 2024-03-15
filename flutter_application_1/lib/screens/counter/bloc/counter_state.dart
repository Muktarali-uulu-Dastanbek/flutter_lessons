// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

class CounterInitialState extends CounterState {}

class CounterLoadingState extends CounterState {}

class CounterLoadedState extends CounterState {
  final int updatedCounter;

  CounterLoadedState({required this.updatedCounter});
}

class CounterErrorState extends CounterState {}

class CounterRemoveState extends CounterState {
  final int updatedCounter;
  CounterRemoveState({required this.updatedCounter});
}
