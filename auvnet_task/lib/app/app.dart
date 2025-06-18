import 'package:auvnet_task/core/router/app_router.dart';
import 'package:auvnet_task/core/theme/bloc/theme_bloc.dart';
import 'package:auvnet_task/core/theme/themes/dark_theme.dart';
import 'package:auvnet_task/core/theme/themes/light_theme.dart';
import 'package:auvnet_task/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_task/injection_container.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.serviceLocator<ThemeBloc>()..add(GetInitialTheme()),
        child: BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, theme) {
              return MaterialApp(
                title: "Auvnet Task",
                theme: theme,
                onGenerateRoute: AppRouter.onGenerateRoute,
                initialRoute: AppRouter.splashRoute,
              );
            }
        ),
    );
  }
}