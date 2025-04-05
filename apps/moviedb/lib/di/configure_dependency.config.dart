// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:database/realm_database.dart' as _i517;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network_service/api/configuration_api_endpoint.dart' as _i48;
import 'package:network_service/api/moviedb_api_endpoint.dart' as _i590;
import 'package:network_service/dio_client.dart' as _i324;

import '../presenter/discover/bloc/discover_bloc.dart' as _i659;
import '../presenter/favorite/cubit/favorite_cubit.dart' as _i344;
import '../presenter/settings/cubit/settings_cubit.dart' as _i543;
import '../repository/movie_repository.dart' as _i550;
import '../repository/movie_repository_impl.dart' as _i266;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModule = _$DiModule();
    gh.singleton<_i324.DioClient>(() => diModule.provideDioClient());
    gh.singleton<_i517.RealmDatabase>(() => diModule.provideRealmDatabase());
    gh.lazySingleton<_i590.MoviedbApiEndpoint>(
        () => diModule.provideMoviedbApiEndpoint());
    gh.lazySingleton<_i48.ConfigurationApiEndpoint>(
        () => diModule.provideConfigurationApiEndpoint());
    gh.lazySingleton<_i550.MovieRepository>(() => _i266.MovieRepositoryImpl(
          gh<_i590.MoviedbApiEndpoint>(),
          gh<_i517.RealmDatabase>(),
          gh<_i48.ConfigurationApiEndpoint>(),
        ));
    gh.lazySingleton<_i543.SettingsCubit>(
        () => _i543.SettingsCubit(gh<_i550.MovieRepository>()));
    gh.singleton<_i659.DiscoverBloc>(
        () => _i659.DiscoverBloc(gh<_i550.MovieRepository>()));
    gh.singleton<_i344.FavoriteCubit>(
        () => _i344.FavoriteCubit(gh<_i550.MovieRepository>()));
    return this;
  }
}

class _$DiModule extends _i211.DiModule {}
