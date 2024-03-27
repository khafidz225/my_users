import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository userRepositoryImpl;
  UserUseCase(this.userRepositoryImpl);

  Future<List<ModelUser>> get() async {
    return userRepositoryImpl.getUsers();
  }

  Future post() async {
    userRepositoryImpl.postUsers();
  }
}
