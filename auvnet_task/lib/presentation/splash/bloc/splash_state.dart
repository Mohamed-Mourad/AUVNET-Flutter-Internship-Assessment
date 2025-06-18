part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

/// The initial state of the SplashBloc.
class SplashInitial extends SplashState {}

/// State indicating the app should navigate to the onboarding screens.
class NavigateToOnboarding extends SplashState {}

/// State indicating the app should navigate to the authentication flow (e.g., Login screen).
class NavigateToAuth extends SplashState {}

/// State indicating the app should navigate to the main home screen.
class NavigateToHome extends SplashState {}