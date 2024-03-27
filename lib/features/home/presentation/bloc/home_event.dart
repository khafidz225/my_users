part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainGetUserEvent extends HomeEvent {
  final String? keyword;

  MainGetUserEvent(this.keyword);
}

class MainGetCityEvent extends HomeEvent {}

class HomeShowSliderEvent extends HomeEvent {
  late final String? id;
  HomeShowSliderEvent(this.id);
}
