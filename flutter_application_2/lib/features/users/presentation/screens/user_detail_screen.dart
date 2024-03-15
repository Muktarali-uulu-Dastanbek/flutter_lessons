import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/users/data/repositories/users_repository_impl.dart';
import 'package:flutter_application_2/features/users/domain/use_cases/users_use_case.dart';
import 'package:flutter_application_2/features/users/presentation/logic/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailScreen extends StatefulWidget {
  final int? id;
  const UserDetailScreen({super.key, required this.id});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  UsersBloc usersBloc = UsersBloc(
      usersUseCase: UsersUseCase(usersRepository: UsersRepositoryImpl()));

  @override
  void initState() {
    usersBloc.add(GetUserDetailEvent(id: widget.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<UsersBloc, UsersState>(
          bloc: usersBloc,
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is UsersErrorState) {
              return ElevatedButton(
                onPressed: () {},
                child: Text("Повторить"),
              );
            }
            if (state is UserDetailLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${state.userModel.id}'),
                  Text('${state.userModel.name}'),
                  Text('${state.userModel.phone}'),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
