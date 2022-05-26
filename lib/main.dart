import 'package:flutter/material.dart';
import 'package:moviedb/src/app.dart';
import 'package:moviedb/src/di/injector.dart';

Future<void> main() async {
  await initDependencies();
  runApp(const App());
}
