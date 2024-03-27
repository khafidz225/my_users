import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/core/routes/app_pages.dart';
import 'package:my_users/core/shared/utils/global_function.dart';
import 'package:my_users/core/shared/utils/palette.dart';
import 'package:my_users/core/shared/widget/list_tile/customListTile.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Users',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BlocSelector<HomeBloc, HomeState, String>(
                    selector: (state) {
                      if (state is HomeGetUserSuccessState) {
                        return state.users.length.toString();
                      } else {
                        return '';
                      }
                    },
                    builder: (context, state) => Text(
                      state,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width,
                  height: 45,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              labelText: 'Cari',
                              suffixIcon: const Icon(Icons.search)),
                          onChanged: (value) {
                            serviceLocator<HomeBloc>()
                                .add(MainGetUserEvent(value));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.HOMEFILTER);
                        },
                        child: Container(
                          // padding: const EdgeInsets.all(5),
                          width: 45, height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Palette.n50,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.filter_list_rounded),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    print('rebuild: ');
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
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: state.users
                                .map((data) => CustomListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Palette.hexToColor(
                                            GlobalFunctions.setCharColor(
                                                data.name ?? '')),
                                        child: Text(
                                          GlobalFunctions.setCharName(
                                              data.name ?? ''),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Palette.n0),
                                        ),
                                      ),
                                      title: data.name ?? '-',
                                      subtitle: 'Email: ',
                                      subtitle2: 'Phone: ',
                                      subtitle3: 'City: ',
                                      subtitles: data.email,
                                      subtitles2: data.phoneNumber,
                                      subtitles3: data.city,
                                      height: 120,
                                      more: true,
                                      moreOptionType:
                                          MoreOptionType.moreOptionTap,
                                      onTapMore: () {
                                        // serviceLocator<HomeBloc>().add(HomeShowSlider(data.id));
                                        // serviceLocator<HomeBloc>()
                                        //     .add(HomeShowSliderEvent(data.id));
                                        serviceLocator<HomeBloc>().add(
                                            MainGetUserEvent(controller.text));
                                        // print('isShowL ${state.isShow}');

                                        print('state.id: ${state.id}');
                                      },
                                      titleMore1: 'edit',
                                      titleMore2: 'delete',
                                      isOpenMore: state.id == data.id,
                                    ))
                                .toList(),
                          ),
                        ),
                      );
                    }
                    return const Text('Data not found');
                  },
                )
                // SingleChildScrollView(
                //   child: Column(
                //     children: [

                //     ],
                //   ),
                // )
              ],
            )
            // BlocBuilder<HomeBloc, HomeState>(
            //   builder: (context, state) {
            //     if (state is HomeLoadingState) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //     if (state is HomeGetUserErrorState) {
            // return Center(
            //   child: Text(
            //     state.message,
            //     textAlign: TextAlign.center,
            //   ),
            // );
            //     }
            //     if (state is HomeGetUserSuccessState) {
            //       print('state: ${state.users.map((e) => e.name)}');
            //       return Center(
            //         child: Column(
            //           children: [
            //             TextFormField(
            //               onChanged: (value) {
            // serviceLocator<HomeBloc>()
            //     .add(MainGetUserEvent(value));
            //               },
            //             ),
            //             Column(
            //               children: state.users
            //                   .map((e) => Text(e.name ?? '-'))
            //                   .toList(),
            //             ),
            //           ],
            //         ),
            //       );
            //     }
            //     return const SizedBox(
            //       child: Text('Ga ada datanya'),
            //     );
            //   },
            // ),
            ),
      ),
    );
  }
}
