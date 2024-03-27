import 'package:my_users/features/home/domain/model/model_user.dart';

abstract class UserRepository {
  Future<List<ModelUser>> getUsers();
}
