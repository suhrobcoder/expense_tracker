part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class SelectPageEvent extends MainEvent {
  const SelectPageEvent(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}
