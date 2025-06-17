
import 'package:auvnet_task/core/theme/bloc/theme_bloc.dart';
import 'package:auvnet_task/layout/home_layout.dart';
import 'package:auvnet_task/core/theme/themes/dark_theme.dart';
import 'package:auvnet_task/core/theme/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [],
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp(
                title: "Auvnet Task",
                theme: _getThemeData(themeState),
                home: const HomeLayout(),
              );
            }
        ),
    );
  }

  ThemeData _getThemeData(ThemeState themeState) {
    switch(themeState) {
      case ThemeState.light:
        return LightTheme.theme;
      case ThemeState.dark:
        return DarkTheme.theme;
    }
  }
}