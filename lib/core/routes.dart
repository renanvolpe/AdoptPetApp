
import 'package:adopt_pet_app/features/animals/pages/home_animals_page.dart';
import 'package:adopt_pet_app/features/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const HomePage(),
    ),
    GoRoute(
      path: '/animals',
      builder: (context, state) =>  HomeAnimalsPage(),
    ),
  
  ],
);