import 'package:my_users/features/home/data/api/city_api.dart';
import 'package:my_users/features/home/domain/model/model_city.dart';
import 'package:my_users/features/home/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityApi cityApi;
  CityRepositoryImpl({required this.cityApi});
  @override
  Future<List<ModelCity>> getCity() {
    return cityApi.getListCity();
  }
}
