import 'package:flutter_application_2/features/users/data/models/user_model.dart';
import 'package:flutter_application_2/features/users/domain/repositories/users_repository.dart';

class UsersUseCase {
  final UsersRepository usersRepository;

  const UsersUseCase({required this.usersRepository});

  Future<List<UserModel>> getAllUsers() async {
    return await usersRepository.getAllUsers();
  }

  Future<UserModel> getUserDetail({required int id}) async {
    return await usersRepository.getUserDetail(id: id);
  }
}
