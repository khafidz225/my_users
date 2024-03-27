import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/usecase/get_user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<MainGetUserEvent>(mainGetUserEvent);
    on<HomeShowSliderEvent>(homeShowSloder);
  }
  List<ModelUser> valueListUser = [];
  String? idUser;

  Future mainGetUserEvent(
      MainGetUserEvent event, Emitter<HomeState> emit) async {
    if (event.keyword == null) {
      emit(HomeLoadingState());
    }
    print('event.keyrowd: ${event.keyword}');
    await serviceLocator<GetUserUseCase>().call().then((value) {
      if (event.keyword != null) {
        valueListUser = value
            .where((element) => element.name!
                .toLowerCase()
                .contains(event.keyword!.toLowerCase()))
            .toList();
      } else {
        valueListUser = value;
      }

      print('valueListUser: ${valueListUser.map((e) => e.name)}');
      return emit(HomeGetUserSuccessState(valueListUser, idUser));
    }).onError(
        (error, stackTrace) => emit(HomeGetUserErrorState(error.toString())));
  }

  Future homeShowSloder(
      HomeShowSliderEvent event, Emitter<HomeState> emit) async {
    idUser = event.id;
    print('homeshow 1: ${event.id}');
    print('homeshow 2: $idUser');
    return emit(HomeGetUserSuccessState(valueListUser, idUser));
  }
}
