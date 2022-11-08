part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';
}
