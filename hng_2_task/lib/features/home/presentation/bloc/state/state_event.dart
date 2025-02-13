sealed class StatesEvent {}

class LoadStates extends StatesEvent {
  final String countryId;
  LoadStates(this.countryId);
}
