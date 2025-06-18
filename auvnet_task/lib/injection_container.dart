import 'package:auvnet_task/core/theme/bloc/theme_bloc.dart';
import 'package:auvnet_task/data/datasources/user_prefs_data_source.dart';
import 'package:auvnet_task/data/datasources/user_prefs_data_source_impl.dart';
import 'package:auvnet_task/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:auvnet_task/presentation/splash/bloc/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {

  // Data Sources
  serviceLocator.registerLazySingleton<UserPrefsDataSource>(
      () => UserPrefsDataSourceImpl(
          hive: serviceLocator(),
      ),
  );

  // External
  serviceLocator.registerLazySingleton<HiveInterface>(() => Hive);

  // BLoCs
  serviceLocator.registerFactory(
      () => SplashBloc(
          userPrefsDataSource: serviceLocator(),
      ),
  );

  serviceLocator.registerFactory(
      () => OnboardingBloc(
          userPrefsDataSource: serviceLocator(),
      ),
  );

  serviceLocator.registerFactory(
        () => ThemeBloc(
      userPrefsDataSource: serviceLocator(),
    ),
  );
}