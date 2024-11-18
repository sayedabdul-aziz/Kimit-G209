import 'package:bookia_2/core/services/local/local_storage.dart';
import 'package:bookia_2/core/utils/themes.dart';
import 'package:bookia_2/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_2/feature/home/presentation/bloc/home_bloc.dart';
import 'package:bookia_2/feature/intro/presentation/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: const SplashView(),
      ),
    );
  }
}