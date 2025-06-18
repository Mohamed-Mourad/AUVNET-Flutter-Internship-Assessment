import 'package:auvnet_task/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../injection_container.dart' as di;
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.serviceLocator<SplashBloc>()..add(CheckInitialStatus()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateToOnboarding) {
            Navigator.of(context).pushReplacementNamed(AppRouter.onboardingRoute);
          } else if (state is NavigateToAuth) {
            Navigator.of(context).pushReplacementNamed(AppRouter.loginRoute);
          } else if (state is NavigateToHome) {
            Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/nawel.png",
                ),
                const SizedBox(height: 24),
                CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
