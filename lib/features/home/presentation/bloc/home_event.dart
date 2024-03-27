part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainGetUserEvent extends HomeEvent {
  final String? keyword;
  final bool? isShow;
  MainGetUserEvent(this.keyword, this.isShow);
}

class HomeShowSliderEvent extends HomeEvent {
  late final String? id;
  HomeShowSliderEvent(this.id);
}
