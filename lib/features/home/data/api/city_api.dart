import 'package:dio/dio.dart';
import 'package:my_users/features/home/domain/model/model_city.dart';

class CityApi {
  final Dio dio;
  final String path;
  CityApi({required this.dio, required this.path});

  Future<List<ModelCity>> getListCity() async {
    final res = await dio.get(path);
    return List<Map<String, dynamic>>.from(res.data)
        .map((e) => ModelCity.fromJson(e))
        .toList();
  }
}
