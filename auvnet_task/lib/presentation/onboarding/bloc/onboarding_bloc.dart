import 'package:equatable/equatable.dart';
import 'package:auvnet_task/data/datasources/user_prefs_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Adjust import path if needed

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final UserPrefsDataSource _userPrefsDataSource;

  OnboardingBloc({required UserPrefsDataSource userPrefsDataSource})
      : _userPrefsDataSource = userPrefsDataSource,
        super(const OnboardingState()) {
    on<PageChanged>(_onPageChanged);
    on<OnboardingCompleted>(_onOnboardingCompleted);
  }

  void _onPageChanged(PageChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  Future<void> _onOnboardingCompleted(
      OnboardingCompleted event,
      Emitter<OnboardingState> emit,
      ) async {
    // Fulfill the contract: save the onboarding status.
    await _userPrefsDataSource.setHasSeenOnboarding();
    // Emit a new state to trigger navigation in the UI.
    emit(NavigateToLogin());
  }
}