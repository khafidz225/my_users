import 'package:my_users/features/home/domain/model/model_city.dart';
import 'package:my_users/features/home/domain/repository/city_repository.dart';

class CityUseCase {
  final CityRepository cityRepositoryImpl;
  CityUseCase(this.cityRepositoryImpl);

  Future<List<ModelCity>> get() async {
    return await cityRepositoryImpl.getCity();
  }
}
