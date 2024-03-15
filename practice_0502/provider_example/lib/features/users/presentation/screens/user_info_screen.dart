import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/features/users/data/repositories/users_repository_impl.dart';
import 'package:provider_example/features/users/domain/use_cases/users_use_case.dart';
import 'package:provider_example/features/users/presentation/logic/bloc/users_bloc.dart';
import 'package:provider_example/internal/dependencies/get_it.dart';

class UserInfoScreen extends StatefulWidget {
  final int id;
  const UserInfoScreen({super.key, required this.id});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  // UsersBloc bloc = UsersBloc(
  //   usersUseCase: UsersUseCase(
  //     usersRepository: UsersRepositoryImpl(),
  //   ),
  // );

  UsersBloc bloc = getIt<UsersBloc>();
  @override
  void initState() {
    bloc.add(GetUserByIdEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<UsersBloc, UsersState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return CircularProgressIndicator();
            }

            if (state is UserInfoLoadedState) {
              return Container(
                height: 200,
                width: 200,
                color: Colors.black,
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
