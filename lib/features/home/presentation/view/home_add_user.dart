import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/shared/utils/palette.dart';
import 'package:my_users/core/shared/widget/dropdown/dropdown_custom.dart';
import 'package:my_users/core/shared/widget/list_tile/inputListTile.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

class HomeAddUser extends StatelessWidget {
  const HomeAddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(Get.width, 50),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: GestureDetector(
                    onTap: () async {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_outlined,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Add User',
                  style: TextStyle(
                    fontSize: 16,
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
            Expanded(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputListTile(
                        title: 'Name',
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Example: Khafidz Maulana',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      InputListTile(
                        title: 'Email',
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Example: Khafidz@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your Email';
                            } else if (value.isEmail) {
                              return 'Email not valid';
                            }
                            return null;
                          },
                        ),
                      ),
                      InputListTile(
                        title: 'Phone Number',
                        child: TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Example: ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your Phone Number';
                            }
                            return null;
                          },
                        ),
                      ),
                      InputListTile(
                        title: 'City',
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeGetCitySuccessState) {
                              print(
                                  'widget valueCityState: ${state.valueCityState}');
                              return DropdownCustom(
                                items: state.city
                                    .map((e) => DropdownMenuItem(
                                        value: e.name,
                                        child: Text(e.name ?? '-')))
                                    .toList(),
                                onChanged: (value) {},
                                value: null,
                                controller: cityController,
                                isConditionNull: false,
                                hintText: 'Please select a city',
                              );
                            }
                            return DropdownCustom(
                              items: const [],
                              value: null,
                              controller: cityController,
                              onChanged: (value) {},
                              isConditionNull: false,
                              hintText: 'Loading...',
                            );
                          },
                        ),
                      ),
                      InputListTile(
                        title: 'Address',
                        child: TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: 'Example: ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your Address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.g40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Get.back();
                          }

                          // print('filterController: ${filterController.text}');
                          // serviceLocator<HomeBloc>().add(MainGetUserEvent(
                          //     valueCity: filterController.text == ''
                          //         ? null
                          //         : filterController.text,
                          //     isReload: false));
                          // serviceLocator<HomeBloc>().add(MainGetCityEvent(
                          //     valueCity: filterController.text, isReload: false));
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w700),
                        )),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
