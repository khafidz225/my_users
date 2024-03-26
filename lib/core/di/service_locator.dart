import 'package:get_it/get_it.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

setupServiceLocator() async {
  serviceLocator.registerFactory<HomeBloc>(() => HomeBloc());
}
