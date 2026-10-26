import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'models/item.dart';
import 'pages/home_page.dart';
import 'pages/item_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: [
        GoRoute(
          path: 'item',
          builder: (BuildContext context, GoRouterState state) {
            final item = state.extra as Item;
            return ItemPage(item: item);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Aplikasi Belanja',
      debugShowCheckedModeBanner: false,
    );
  }
}