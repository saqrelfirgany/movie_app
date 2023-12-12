import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_screen/home_screen.dart';
import '../../features/intro/splash_screen/splash_screen.dart';
import '../../main.dart';
import '../widgets/photo_view_screen.dart';
import 'app_route_names.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  observers: [
    FlutterSmartDialog.observer,
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error ?? GoException('General error message'),
  ),
  routes: [
    /// Home
    GoRoute(
      path: AppRouteName.splashScreenRoute,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: AppRouteName.homeScreenRoute,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRouteName.photoViewScreenRoute,
      builder: (context, state) => PhotoViewScreen(),
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: PhotoViewScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});

  final GoException error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$error')),
    );
  }
}
