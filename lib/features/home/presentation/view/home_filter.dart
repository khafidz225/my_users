import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/core/shared/utils/palette.dart';
import 'package:my_users/core/shared/widget/dropdown/dropdown_custom.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController filterController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 50),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        serviceLocator<HomeBloc>().add(MainGetUserEvent());
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Filter User',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'City',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        color: Palette.n70),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeGetCitySuccessState) {
                        return DropdownCustom(
                          items: state.city
                              .map((e) => DropdownMenuItem(
                                  value: e.name, child: Text(e.name ?? '-')))
                              .toList(),
                          onChanged: (value) {},
                          controller: filterController,
                          isConditionNull: false,
                          hintText: 'Please select a city',
                        );
                      }
                      return DropdownCustom(
                        items: const [],
                        controller: filterController,
                        onChanged: (value) {},
                        isConditionNull: false,
                        hintText: 'Loading...',
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              side: BorderSide(color: Palette.r50)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Setel Ulang',
                          style: TextStyle(
                              color: Palette.r50,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mulish'),
                        )),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.g40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: const Text(
                          'Terapkan Filter',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700),
                        )),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
