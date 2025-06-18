import 'package:auvnet_task/data/datasources/user_prefs_data_source.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserPrefsDataSource _userPrefsDataSource;

  SplashBloc({required UserPrefsDataSource userPrefsDataSource})
      : _userPrefsDataSource = userPrefsDataSource,
        super(SplashInitial()) {
    on<CheckInitialStatus>(_onCheckInitialStatus);
  }

  Future<void> _onCheckInitialStatus(
      CheckInitialStatus event,
      Emitter<SplashState> emit,
      ) async {
    await Future.delayed(const Duration(seconds: 2));

    final hasSeenOnboarding = await _userPrefsDataSource.getHasSeenOnboarding();

    if (!hasSeenOnboarding) {
      emit(NavigateToOnboarding());
    } else {
      // TODO: add logic here to check auth status.
      // For now, we'll default to the onboarding screen.
      emit(NavigateToOnboarding());
    }
  }
}