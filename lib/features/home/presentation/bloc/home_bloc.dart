import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/domain/model/model_city.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/usecase/city_usecase.dart';
import 'package:my_users/features/home/domain/usecase/user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<MainGetUserEvent>(mainGetUserEvent);
    on<HandlePostUserEvent>(handlePostUserEvent);
    on<MainGetCityEvent>(mainGetCityEvent);
  }
  String? idUser;
  String? valueCity;
  ModelUser? postUsers;
  List<ModelUser> valueListUser = [];
  List<ModelCity> valueListCity = [];

  Future mainGetUserEvent(
      MainGetUserEvent event, Emitter<HomeState> emit) async {
    if (event.keyword == null) {
      emit(HomeLoadingState());
    }

    if (valueListUser.isEmpty ||
        event.keyword != null ||
        event.valueCity != null ||
        event.isReload) {
      await serviceLocator<UserUseCase>().get().then((value) async {
        valueListUser = value;
        if (event.keyword != null) {
          valueListUser = valueListUser
              .where((element) => element.name!
                  .toLowerCase()
                  .contains(event.keyword!.toLowerCase()))
              .toList();
        }

        if (event.valueCity != null) {
          valueListUser = valueListUser
              .where((element) => element.city!
                  .toLowerCase()
                  .contains(event.valueCity!.toLowerCase()))
              .toList();
        }

        valueListUser.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
        );
        return emit(HomeGetUserSuccessState(valueListUser, idUser));
      }).onError(
          (error, stackTrace) => emit(HomeGetUserErrorState(error.toString())));
    } else {
      emit(HomeGetUserSuccessState(valueListUser, idUser));
    }
  }

  Future handlePostUserEvent(
      HandlePostUserEvent event, Emitter<HomeState> emit) async {
    postUsers = event.dataUser;
    await serviceLocator<UserUseCase>().post(event.dataUser).then((value) {});
  }

  Future mainGetCityEvent(
      MainGetCityEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    if (event.valueCity == null || event.isReload) {
      valueCity = event.isReload ? null : event.valueCity ?? valueCity;
      await serviceLocator<CityUseCase>().get().then((value) {
        valueListCity = value;
        valueListCity.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()),
        );
        return emit(HomeGetCitySuccessState(
            city: valueListCity, valueCityState: valueCity));
      });
    } else {
      valueCity = event.valueCity ?? valueCity;

      HomeGetCitySuccessState(city: valueListCity, valueCityState: valueCity);
    }
  }
}
