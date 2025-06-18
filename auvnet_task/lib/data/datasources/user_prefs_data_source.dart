abstract class UserPrefsDataSource {
  /// Checks if the user has seen the onboarding screens
  /// Returns `true` if the have, `false` if not
  Future<bool> getHasSeenOnboarding();

  /// Marks the onboarding screens as seen/
  Future<void> setHasSeenOnboarding();

  /// Gets the cached theme name (light or dark).
  /// Returns null if no theme is cached
  Future<String?> getTheme();

  /// Caches the current theme preference
  Future<void> cacheTheme(String themeName);
}