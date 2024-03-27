import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_users/features/home/presentation/view/home_add_user.dart';
import 'package:my_users/features/home/presentation/view/home_filter.dart';
import 'package:my_users/features/home/presentation/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    // HOME
    GetPage(
      name: _Paths.HOME,
      page: () => BlocProvider.value(
        value: serviceLocator<HomeBloc>()
          ..add(MainGetUserEvent(isReload: false)),
        child: const HomeView(),
      ),
    ),

    // HOME FILTER
    GetPage(
        name: _Paths.HOMEFILTER,
        page: () => BlocProvider.value(
              value: serviceLocator<HomeBloc>()
                ..add(MainGetCityEvent(
                    valueCity: serviceLocator<HomeBloc>().valueCity,
                    isReload: false)),
              child: const HomeFilter(),
            ),
        fullscreenDialog: true,
        transitionDuration: const Duration(milliseconds: 500)),

    //ADD USERS
    GetPage(
        name: _Paths.HOMEADDUSER,
        page: () => BlocProvider.value(
              value: serviceLocator<HomeBloc>()
                ..add(MainGetCityEvent(
                    valueCity: serviceLocator<HomeBloc>().valueCity,
                    isReload: false)),
              child: const HomeAddUser(),
            ),
        fullscreenDialog: true,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
