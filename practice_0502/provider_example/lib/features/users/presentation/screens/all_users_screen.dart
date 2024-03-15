import 'package:flutter/material.dart';
import 'package:provider_example/features/users/data/repositories/users_repository_impl.dart';
import 'package:provider_example/features/users/domain/use_cases/users_use_case.dart';
import 'package:provider_example/features/users/presentation/logic/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/features/users/presentation/screens/user_info_screen.dart';
import 'package:provider_example/internal/dependencies/get_it.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  // UsersBloc bloc = UsersBloc(
  //   usersUseCase: UsersUseCase(
  //     usersRepository: UsersRepositoryImpl(),
  //   ),
  // );

  UsersBloc bloc = getIt<UsersBloc>();

  @override
  void initState() {
    bloc.add(GetAllUsersEvent());
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
            if (state is UsersLoadedState) {
              return ListView.separated(
                itemCount: state.usersModelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserInfoScreen(
                            id: state.usersModelList[index].id ?? 0,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text(state.usersModelList[index].id.toString()),
                          Text(state.usersModelList[index].name ?? "-"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
