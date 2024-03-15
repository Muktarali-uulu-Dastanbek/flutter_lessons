// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int counter;

  IncrementEvent({required this.counter});
}

class Decrement extends CounterEvent {
  final int counter;
  Decrement({required this.counter});
}
