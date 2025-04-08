import 'package:flutter/material.dart';
import 'package:lms_project/core/route/route_generators.dart';
import 'package:lms_project/core/route/route_names.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.firstSplashPage,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
