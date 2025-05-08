import 'package:article_recommendation_system/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:article_recommendation_system/core/theme/theme.dart';
import 'package:article_recommendation_system/features/articles/domain/dbHelper/connect.dart';
import 'package:article_recommendation_system/features/articles/presentation/pages/article_page.dart';
import 'package:article_recommendation_system/features/articles/presentation/pages/form_page_one.dart';
import 'package:article_recommendation_system/features/articles/presentation/pages/form_page_two.dart';
import 'package:article_recommendation_system/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:article_recommendation_system/features/auth/presentation/pages/login_page.dart';
import 'package:article_recommendation_system/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await MongoDatabase.connect();
  await initDependcies();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => serviceLocator<AppUserCubit>(),
    ),
    BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Article App',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const FormPageOne();
          }
          return const LogInPage();
        },
      ),
    );
  }
}
