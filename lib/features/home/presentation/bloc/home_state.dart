part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetUserSuccessState extends HomeState {
  final List<ModelUser> users;
  HomeGetUserSuccessState(this.users);

  @override
  List<Object> get props => [users];
}

// ignore: must_be_immutable
class HomeGetUserErrorState extends HomeState {
  String message;
  HomeGetUserErrorState(this.message);

  @override
  List<Object> get props => [message];
}
