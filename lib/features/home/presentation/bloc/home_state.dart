part of 'home_bloc.dart';

sealed class HomeState {
  int number;
  HomeState(
    this.number,
  );
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(0);
}

class HomeLoaded extends HomeState {
  HomeLoaded(int number) : super(number);
}
