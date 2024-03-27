import 'package:dio/dio.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';

class UserApi {
  final Dio dio;
  final String path;
  UserApi({required this.dio, required this.path});
  Future<List<ModelUser>> getListUsers() async {
    final res = await dio.get(path);
    return List<Map<String, dynamic>>.from(res.data)
        .map((e) => ModelUser.fromJson(e))
        .toList();
  }
}
