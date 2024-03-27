import 'package:my_users/features/home/domain/model/model_user.dart';
import 'package:my_users/features/home/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepositoryImpl;
  GetUserUseCase(this.userRepositoryImpl);
  Future<List<ModelUser>> call() async {
    return userRepositoryImpl.getUsers();
  }
}
