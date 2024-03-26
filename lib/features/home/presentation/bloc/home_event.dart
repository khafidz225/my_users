part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeIncrementEvent extends HomeEvent {
  final int number;

  HomeIncrementEvent({this.number = 1});
}

class HomeDecrementEvent extends HomeEvent {}
