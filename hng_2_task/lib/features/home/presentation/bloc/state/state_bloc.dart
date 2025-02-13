import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hng_2_task/features/features.dart';

class StatesBloc extends Bloc<StatesEvent, StatesState> {
  final StateRepository repository;

  StatesBloc(this.repository) : super(StatesInitial()) {
    on<LoadStates>(_onLoadStates);
  }

  Future<void> _onLoadStates(
      LoadStates event, Emitter<StatesState> emit) async {
    emit(StatesLoading());

    final states = await repository.getStates(event.countryId);

    states.fold((failure) {
      emit(StatesError("Could not get states"));
    }, (states) {
      emit(StatesLoaded(states));
    });
  }
}
