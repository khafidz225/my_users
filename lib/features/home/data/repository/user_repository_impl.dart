import 'package:my_users/features/home/data/api/user_api.dart';
import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApi userApi;
  UserRepositoryImpl({
    required this.userApi,
  });

  @override
  Future<List<ModelUser>> getUsers() {
    return userApi.getListUsers();
  }

  @override
  Future postUsers() {
    return userApi.postUsers();
  }
}
