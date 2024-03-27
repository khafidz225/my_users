import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_users/core/di/service_locator.dart';
import 'package:my_users/core/shared/utils/palette.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/presentation/bloc/home_bloc.dart';

class UserApi {
  final Dio dio;
  final String path;
  UserApi({required this.dio, required this.path});

  // Get
  Future<List<ModelUser>> getListUsers() async {
    final res = await dio.get(path);
    return List<Map<String, dynamic>>.from(res.data)
        .map((e) => ModelUser.fromJson(e))
        .toList();
  }

  // Post
  Future postUsers(ModelUser dataUser) async {
    await dio.post(path, data: dataUser.toJson()).then((value) async {
      serviceLocator<HomeBloc>().add(MainGetUserEvent(isReload: true));

      Get.showSnackbar(GetSnackBar(
        title: 'Success',
        message: 'Successfully added users',
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Palette.g40,
        duration: const Duration(seconds: 2),
      ));
    });
  }
}
