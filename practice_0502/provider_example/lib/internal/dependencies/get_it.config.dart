// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/users/data/repositories/users_repository_impl.dart'
    as _i4;
import '../../features/users/domain/repositories/users_repository.dart' as _i3;
import '../../features/users/domain/use_cases/users_use_case.dart' as _i5;
import '../../features/users/presentation/logic/bloc/users_bloc.dart' as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.UsersRepository>(() => _i4.UsersRepositoryImpl());
  gh.factory<_i5.UsersUseCase>(
      () => _i5.UsersUseCase(usersRepository: gh<_i3.UsersRepository>()));
  gh.factory<_i6.UsersBloc>(
      () => _i6.UsersBloc(usersUseCase: gh<_i5.UsersUseCase>()));
  return getIt;
}
