import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final TextEditingController controller = TextEditingController();
    on<HomeIncrementEvent>((event, emit) {
      emit(state is HomeLoaded
          ? HomeLoaded(state.number + event.number)
          : HomeLoaded(event.number));
    });
  }
}
