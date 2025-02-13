import 'package:hng_2_task/features/features.dart';

sealed class StatesState {}

class StatesInitial extends StatesState {}

class StatesLoading extends StatesState {}

class StatesLoaded extends StatesState {
  final List<StateEntity> states;

  StatesLoaded(
    this.states,
  );
}

class StatesError extends StatesState {
  final String message;
  StatesError(this.message);
}
