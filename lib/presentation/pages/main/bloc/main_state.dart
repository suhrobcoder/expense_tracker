part of 'main_bloc.dart';

class MainState extends Equatable {
  const MainState({
    this.currentPage = 1,
  });

  final int currentPage;

  MainState copyWith({
    int? currentPage,
  }) {
    return MainState(
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [currentPage];
}
