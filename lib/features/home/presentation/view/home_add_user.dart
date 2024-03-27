import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/core/shared/utils/palette.dart';
import 'package:my_users/core/shared/widget/appbar/sub_appbar.dart';
import 'package:my_users/core/shared/widget/dropdown/dropdown_custom.dart';
import 'package:my_users/core/shared/widget/list_tile/inputListTile.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
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

    FocusNode nameFocusNode = FocusNode();
    FocusNode emailFocusNode = FocusNode();
    FocusNode phoneFocusNode = FocusNode();
    FocusNode addressFocusNode = FocusNode();
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 50),
        child: SubAppbar(
          onTap: () async {
            Get.back(closeOverlays: true);
            serviceLocator<HomeBloc>().add(MainGetUserEvent(isReload: false));
          },
          title: 'Add User',
        ),
      ),
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
                          focusNode: nameFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Example: Khafidz Maulana',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            nameFocusNode.unfocus();
                            FocusScope.of(context).requestFocus(emailFocusNode);
                          },
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
                          focusNode: emailFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Example: Khafidz@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            emailFocusNode.unfocus();
                            FocusScope.of(context).requestFocus(phoneFocusNode);
                          },
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your Email';
                            } else if (!value.isEmail) {
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
                          focusNode: phoneFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Example: ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            phoneFocusNode.unfocus();
                            FocusScope.of(context)
                                .requestFocus(addressFocusNode);
                          },
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
                          controller: addressController,
                          focusNode: addressFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Example: ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            addressFocusNode.unfocus();
                          },
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
                            serviceLocator<HomeBloc>().add(
                              HandlePostUserEvent(
                                dataUser: ModelUser(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneNumberController.text,
                                  city: cityController.text,
                                  address: addressController.text,
                                ),
                              ),
                            );
                            Get.back();
                          }
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
