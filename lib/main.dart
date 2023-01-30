import 'package:adopt_pet_app/core/routes.dart';
import 'package:adopt_pet_app/features/cat/bloc/blocGetCatImage/cat_get_image_dart_bloc.dart';
import 'package:adopt_pet_app/features/cat/bloc/blocGetCats/cat_get_bloc.dart';
import 'package:adopt_pet_app/features/dog/bloc/dog_get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DogGetBloc(),
        ),
        BlocProvider(
          create: (context) => CatGetBloc(),
        ),
        //  BlocProvider(
        //   create: (context) => CatGetImageBloc(),
        // ),
        
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
