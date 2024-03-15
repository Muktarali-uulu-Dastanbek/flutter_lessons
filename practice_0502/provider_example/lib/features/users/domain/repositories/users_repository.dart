import 'package:provider_example/features/users/data/models/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getAllUsers();

  Future<UserModel> getUserById(int id);
}
