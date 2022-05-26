import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviedb/src/constants/app_colors.dart';
import 'package:moviedb/src/constants/route_paths.dart';
import 'package:moviedb/src/di/injector.dart';
import 'package:moviedb/src/features/movie/bloc/movie/movie_bloc.dart';
import 'package:moviedb/src/features/movie/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:moviedb/src/features/movie/ui/movie_detail_screen.dart';
import 'package:moviedb/src/features/root/ui/root_screen.dart';
import 'package:moviedb/src/features/splash/ui/splash_screen.dart';
import 'package:moviedb/src/network/model/response/movie/movies_response_model.dart';
import 'package:moviedb/src/repository/api_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => injector<MovieBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie DB',
        theme: ThemeData(
          primarySwatch: AppColors.kSwatchColors,
        ),
        initialRoute: RoutePaths.splash,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashScreen(),
        );

      case RoutePaths.root:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RootScreen(),
        );

      case RoutePaths.movieDetail:
        final Movie movie = settings.arguments! as Movie;

        return MaterialPageRoute<dynamic>(
          builder: (_) => BlocProvider<MovieDetailBloc>(
            create: (_) => MovieDetailBloc(repository: injector<ApiRepository>()),
            child: MovieDetailScreen(
              movie: movie,
            ),
          ),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
