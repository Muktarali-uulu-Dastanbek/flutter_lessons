import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/users/data/models/user_model.dart';
import 'package:flutter_application_2/features/users/domain/use_cases/users_use_case.dart';
import 'package:flutter_application_2/internal/helpers/catch_exception.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersUseCase usersUseCase;

  UsersBloc({required this.usersUseCase}) : super(UsersInitialState()) {
    on<GetAllUsersEvent>((event, emit) async {
      emit(UsersLoadingState());

      try {
        final List<UserModel> usersModelList = await usersUseCase.getAllUsers();

        emit(UsersLoadedState(usersModelList: usersModelList));
      } catch (e) {
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });
    on<GetUserDetailEvent>((event, emit) async {
      emit(UsersLoadingState());

      try {
        final UserModel userModel =
            await usersUseCase.getUserDetail(id: event.id);

        emit(UserDetailLoadedState(userModel: userModel));
      } catch (e) {
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
