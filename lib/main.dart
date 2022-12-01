import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senjayer/business_logic/bloc/auth_bloc/auth.dart';
import 'package:senjayer/data/repositories/local_data_repository.dart';
import 'package:senjayer/utils/constants.dart';
import 'package:sizer/sizer.dart';

import 'presentation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      final LocalDataRepository localDataRepository = LocalDataRepository();
      return BlocProvider(
        create: (context) => AuthenticationBloc(
          localDataRepository: localDataRepository,
        )..add(AppStarted()),
        child: MaterialApp(
          title: 'Senjayer',
          theme: AppConstants().appTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      );
    });
  }
}
