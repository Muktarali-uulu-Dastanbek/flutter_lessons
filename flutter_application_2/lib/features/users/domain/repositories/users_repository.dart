import 'package:flutter_application_2/features/users/data/models/user_model.dart';

abstract class UsersRepository {
  /// RU: Получение всех пользователей
  ///
  /// EN:Getting all users
  Future<List<UserModel>> getAllUsers();

  /// RU: Получение детальной инфомации по id пользователя
  ///
  /// EN:Getting user detail unformation by id
  Future<UserModel> getUserDetail({required int id});
}
