part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final int currentPage;

  const OnboardingState({this.currentPage = 0});

  OnboardingState copyWith({
    int? currentPage,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [currentPage];
}

/// A state that signals the UI to navigate away from onboarding.
class NavigateToLogin extends OnboardingState {}