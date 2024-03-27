import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_users/core/network/network_client.dart';
import 'package:my_users/core/shared/constant.dart';
import 'package:my_users/features/home/data/api/user_api.dart';
import 'package:my_users/features/home/data/repository/user_repository_impl.dart';
import 'package:my_users/features/home/domain/repository/user_repository.dart';
import 'package:my_users/features/home/domain/usecase/get_user_usecase.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  print('setupServiceLocator running...');
  serviceLocator.registerLazySingleton<HomeBloc>(() => HomeBloc());
  serviceLocator.registerFactory<Constant>(() => Constant());
  serviceLocator.registerFactory<Dio>(
    () => NetworkClient(Dio(), constant: serviceLocator()).dio,
  );

  // users
  serviceLocator.registerLazySingleton<UserApi>(() => UserApi(
      dio: serviceLocator(), path: serviceLocator<Constant>().pathUser));
  serviceLocator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userApi: serviceLocator()));
  serviceLocator.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(serviceLocator()),
  );
}
