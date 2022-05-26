import 'package:flutter/material.dart';
import 'package:moviedb/src/constants/app_colors.dart';
import 'package:moviedb/src/constants/route_paths.dart';
import 'package:moviedb/src/features/root/ui/root_screen.dart';
import 'package:moviedb/src/features/splash/ui/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: AppColors.kSwatchColors,
      ),
      initialRoute: RoutePaths.splash,
      onGenerateRoute: _onGenerateRoute,
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