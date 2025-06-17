
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

  ThemeData _getThemneData(ThemeState themeState) {
    switch(themeState) {
      case ThemeState.light:
        return LightTheme.theme;
      case ThemeState.dark:
        return DarkTheme.theme;
    }
  }
}