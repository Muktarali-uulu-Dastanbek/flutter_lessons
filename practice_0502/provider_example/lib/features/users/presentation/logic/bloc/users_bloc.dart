import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:provider_example/features/users/data/models/user_model.dart';
import 'package:provider_example/features/users/domain/use_cases/users_use_case.dart';
import 'package:provider_example/internal/catch_exception.dart';

part 'users_event.dart';
part 'users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersUseCase usersUseCase;
  UsersBloc({required this.usersUseCase}) : super(UsersInitialState()) {
    on<GetAllUsersEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());

        List<UserModel> result = await usersUseCase.getAllUsers();

        emit(UsersLoadedState(usersModelList: result));
      } catch (e) {
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });

    on<GetUserByIdEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());

        UserModel result = await usersUseCase.getUserById(event.id);

        emit(UserInfoLoadedState(userModel: result));
      } catch (e) {
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
