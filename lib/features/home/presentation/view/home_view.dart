import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // HomeBloc homeBloc = context.read<HomeBloc>();
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeGetUserErrorState) {
            return Center(
              child: Text(
                state.message,
                textAlign: TextAlign.center,
              ),
            );
          }
          if (state is HomeGetUserSuccessState) {
            print('state: ${state.users.map((e) => e.name)}');
            return Center(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      serviceLocator<HomeBloc>().add(MainGetUserEvent(value));
                    },
                  ),
                  Column(
                    children:
                        state.users.map((e) => Text(e.name ?? '-')).toList(),
                  ),
                ],
              ),
            );
          }
          return const SizedBox(
            child: Text('Ga ada datanya'),
          );
        },
      ),
    );
  }
}
