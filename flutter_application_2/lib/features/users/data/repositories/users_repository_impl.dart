import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/features/users/data/models/user_model.dart';
import 'package:flutter_application_2/features/users/domain/repositories/users_repository.dart';
import 'package:flutter_application_2/internal/helpers/api_requester.dart';
import 'package:flutter_application_2/internal/helpers/catch_exception.dart';

class UsersRepositoryImpl implements UsersRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet("users");

      print("getAllUsers response statusCode=${response.statusCode}");
      print("getAllUsers response data==${response.data}");

      if (response.statusCode == 200) {
        return response.data
            .map<UserModel>((value) => UserModel.fromJson(value))
            .toList();
      }

      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<UserModel> getUserDetail({required int id}) async {
    try {
      Response response = await apiRequester.toGet("users/$id");

      print("getUserDetail response statusCode=${response.statusCode}");
      log("getUserDetail response data==${response.data}");

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }

      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
