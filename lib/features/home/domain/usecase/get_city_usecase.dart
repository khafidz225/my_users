import 'package:my_users/features/home/domain/model/model_city.dart';
import 'package:my_users/features/home/domain/repository/city_repository.dart';

class GetCityUseCase {
  final CityRepository cityRepositoryImpl;
  GetCityUseCase(this.cityRepositoryImpl);

  Future<List<ModelCity>> call() async {
    return await cityRepositoryImpl.getCity();
  }
}
