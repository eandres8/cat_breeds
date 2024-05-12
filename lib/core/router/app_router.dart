import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:catbreets/ui/screens/home_screen.dart';
import 'package:catbreets/ui/screens/details_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:id',
          name: DetailsScreen.name,
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id'] ?? 'no-id';

            return DetailsScreen(id: id);
          },
        ),
      ],
    ),
  ],
);