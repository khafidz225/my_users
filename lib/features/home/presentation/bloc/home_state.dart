part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object> get props => [];

  String? get idUser => '';
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetUserSuccessState extends HomeState {
  final String? id;
  final List<ModelUser> users;
  HomeGetUserSuccessState(this.users, this.id);

  @override
  List<Object> get props => [users];
  @override
  String? get idUser => id;
}

// ignore: must_be_immutable
class HomeGetUserErrorState extends HomeState {
  String message;
  HomeGetUserErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class HomeGetCitySuccessState extends HomeState {
  final List<ModelCity> city;
  final String? valueCityState;

  HomeGetCitySuccessState({required this.city, this.valueCityState});

  @override
  List<Object> get props => [city];
}
