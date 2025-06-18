part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

/// Event dispatched when the user swipes to a new page.
class PageChanged extends OnboardingEvent {
  final int pageIndex;

  const PageChanged(this.pageIndex);

  @override
  List<Object> get props => [pageIndex];
}

/// Event dispatched when the user taps "Get Started" or "Skip".
class OnboardingCompleted extends OnboardingEvent {}