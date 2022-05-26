import 'package:get_it/get_it.dart';
import 'package:moviedb/src/features/movie/bloc/movie/movie_bloc.dart';
import 'package:moviedb/src/features/tv_show/bloc/tv_show/tvshow_bloc.dart';
import 'package:moviedb/src/repository/api_repository.dart';

final GetIt injector = GetIt.instance;

Future<void> initDependencies() async {
  // Bloc
  injector.registerFactory(() => MovieBloc(repository: injector()));
  injector.registerFactory(() => TVShowBloc(repository: injector()));

  // Repository
  injector.registerLazySingleton(() => ApiRepository());
}
