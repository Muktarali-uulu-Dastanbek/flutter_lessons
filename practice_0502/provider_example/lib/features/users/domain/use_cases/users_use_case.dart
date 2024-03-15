// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:provider_example/features/users/data/models/user_model.dart';
import 'package:provider_example/features/users/domain/repositories/users_repository.dart';

@injectable
class UsersUseCase {
  final UsersRepository usersRepository;

  UsersUseCase({required this.usersRepository});

  Future<List<UserModel>> getAllUsers() async {
    return await usersRepository.getAllUsers();
  }

  Future<UserModel> getUserById(int id) async {
    return await usersRepository.getUserById(id);
  }
}
