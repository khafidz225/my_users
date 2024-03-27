import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';
import 'package:my_users/features/home/presentation/view/home_filter.dart';
import 'package:my_users/features/home/presentation/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => BlocProvider.value(
        value: serviceLocator<HomeBloc>()
          ..add(MainGetUserEvent(
            null,
          )),
        child: const HomeView(),
      ),
    ),
    GetPage(
        name: _Paths.HOMEFILTER,
        page: () => BlocProvider.value(
              value: serviceLocator<HomeBloc>()..add(MainGetCityEvent()),
              child: const HomeFilter(),
            ),
        fullscreenDialog: true,
        transitionDuration: const Duration(milliseconds: 500))
  ];
}
