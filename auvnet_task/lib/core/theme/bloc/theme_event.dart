part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

/// Event to load the initial theme from local storage when the app starts.
class GetInitialTheme extends ThemeEvent {}

/// Event to change the theme and save the new preference.
class ThemeChanged extends ThemeEvent {
  final bool isDark;

  const ThemeChanged({required this.isDark});

  @override
  List<Object> get props => [isDark];
}