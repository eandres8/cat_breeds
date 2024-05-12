import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:catbreets/core/router/app_router.dart';
import 'package:catbreets/ui/blocs/blocs.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatListCubit>(create: (_) => CatListCubit()..requestCatList()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'CatBreeds',
      debugShowCheckedModeBanner: false,
    );
  }
}
