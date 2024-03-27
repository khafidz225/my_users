import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/domain/model/model_city.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/usecase/get_city_usecase.dart';
import 'package:my_users/features/home/domain/usecase/get_user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<MainGetUserEvent>(mainGetUserEvent);
    on<MainGetCityEvent>(mainGetCityEvent);
    on<HomeShowSliderEvent>(homeShowSloder);
  }
  List<ModelUser> valueListUser = [];
  List<ModelCity> valueListCity = [];
  String? idUser;

  Future mainGetUserEvent(
      MainGetUserEvent event, Emitter<HomeState> emit) async {
    if (event.keyword == null) {
      emit(HomeLoadingState());
    }
    print('event.keyrowd: ${event.keyword}');
    await serviceLocator<GetUserUseCase>().call().then((value) async {
      if (event.keyword != null) {
        valueListUser = value
            .where((element) => element.name!
                .toLowerCase()
                .contains(event.keyword!.toLowerCase()))
            .toList();
      } else {
        valueListUser = value;
      }
      valueListUser.sort(
        (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
      );

      print('valueListUser: ${valueListUser.map((e) => e.name)}');
      return emit(HomeGetUserSuccessState(valueListUser, idUser));
    }).onError(
        (error, stackTrace) => emit(HomeGetUserErrorState(error.toString())));
  }

  Future mainGetCityEvent(
      MainGetCityEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await serviceLocator<GetCityUseCase>().call().then((value) {
      valueListCity = value;
      valueListCity.sort(
        (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
      );
      return emit(HomeGetCitySuccessState(valueListCity));
    });
  }

  Future homeShowSloder(
      HomeShowSliderEvent event, Emitter<HomeState> emit) async {
    idUser = event.id;
    print('homeshow 1: ${event.id}');
    print('homeshow 2: $idUser');
    return emit(HomeGetUserSuccessState(valueListUser, idUser));
  }
}
