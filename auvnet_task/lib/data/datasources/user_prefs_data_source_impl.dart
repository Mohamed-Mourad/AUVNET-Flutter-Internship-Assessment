import 'package:hive_flutter/hive_flutter.dart';
import 'user_prefs_data_source.dart';

// Constants for box name and keys.
const String kPrefsBoxName = 'user_preferences';
const String kOnboardingKey = 'has_seen_onboarding';
const String kThemeKey = 'app_theme';

class UserPrefsDataSourceImpl implements UserPrefsDataSource {
  final HiveInterface hive;

  UserPrefsDataSourceImpl({required this.hive});

  /// Opens the preferences box. If it's already open, it returns the instance.
  Future<Box> _getPrefsBox() async {
    return await hive.openBox(kPrefsBoxName);
  }

  @override
  Future<void> cacheTheme(String themeName) async {
    try {
      final box = await _getPrefsBox();
      await box.put(kThemeKey, themeName);
    } catch (e) {
      throw Exception('Could not cache theme: $e');
    }
  }

  @override
  Future<bool> getHasSeenOnboarding() async {
    try {
      final box = await _getPrefsBox();
      return box.get(kOnboardingKey, defaultValue: false) as bool;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getTheme() async {
    try {
      final box = await _getPrefsBox();
      return box.get(kThemeKey) as String?;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> setHasSeenOnboarding() async {
    try {
      final box = await _getPrefsBox();
      await box.put(kOnboardingKey, true);
    } catch (e) {
      throw Exception('Could not set onboarding status: $e');
    }
  }
}
