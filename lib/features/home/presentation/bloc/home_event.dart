part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainGetUserEvent extends HomeEvent {
  final String? keyword;
  final String? valueCity;
  final bool isReload;

  MainGetUserEvent({required this.isReload, this.keyword, this.valueCity});
}

class MainGetCityEvent extends HomeEvent {
  final bool isReload;
  final String? valueCity;
  MainGetCityEvent({required this.isReload, this.valueCity});
}

class HandlePostUserEvent extends HomeEvent {}
