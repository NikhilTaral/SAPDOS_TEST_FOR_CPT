
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sopdas/core/go_route/App_routing.dart';

void main() {
  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({required this.router, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
