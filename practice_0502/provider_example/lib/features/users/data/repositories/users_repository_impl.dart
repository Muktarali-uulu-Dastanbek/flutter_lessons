import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:provider_example/features/users/data/models/user_model.dart';
import 'package:provider_example/features/users/domain/repositories/users_repository.dart';
import 'package:provider_example/internal/api_requester.dart';
import 'package:provider_example/internal/catch_exception.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet("users");

      if (response.statusCode == 200) {
        return response.data
            .map<UserModel>((e) => UserModel.fromJson(e))
            .toList();
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    try {
      Response response = await apiRequester.toGet("users/$id");

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
