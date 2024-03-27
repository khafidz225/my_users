import 'package:dio/dio.dart';
import 'package:my_users/core/shared/constant.dart';
import 'package:my_users/features/home/domain/model/model_city.dart';

class CityApi {
  final Dio dio;
  CityApi({required this.dio});

  Future<List<ModelCity>> getListCity() async {
    final res = await dio.get(Constant().pathCity);
    return List<Map<String, dynamic>>.from(res.data)
        .map((e) => ModelCity.fromJson(e))
        .toList();
  }
}
