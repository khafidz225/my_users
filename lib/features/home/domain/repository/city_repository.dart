import 'package:my_users/features/home/domain/model/model_city.dart';

abstract class CityRepository {
  Future<List<ModelCity>> getCity();
}
