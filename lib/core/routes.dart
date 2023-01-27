import 'package:adopt_pet_app/features/Cat/pages/cat_list_page.dart';
import 'package:adopt_pet_app/features/dog/pages/dog_list_page.dart';
import 'package:adopt_pet_app/features/home/pages/home_animals_page.dart';
import 'package:adopt_pet_app/features/home/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/animals',
      builder: (context, state) => const HomeAnimalsPage(),
    ),
    GoRoute(
      path: '/dogs',
      builder: (context, state) => const DogListPage(),
    ),
    GoRoute(
      path: '/cats',
      builder: (context, state) => const CatListPage(),
    ),
  ],
);
