import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/core/theme/infrastructure/entities/theme_palatte.dart';
import 'package:trek_high/core/theme/infrastructure/repository/theme_repository.dart';

final themeController = StateNotifierProvider<ThemeController, ThemeData>(
  (ref) => ThemeController(ref.read)..fetchTheme(),
);

class ThemeController extends StateNotifier<ThemeData> {
  ThemeController(this._read) : super(AppThemes.lightTheme);
  final Reader _read;

  ThemeRepositoryImpl get _themeRepo => _read(themeRepository);
  Future<void> fetchTheme() async {
    try {
      final theme = await _themeRepo.fetchTheme();

      state = theme.fold(
        (success) => success,
        (failure) => AppThemes.lightTheme,
      );
    } catch (e) {
      state = AppThemes.lightTheme;
    }
  }

  Future<void> changeTheme(bool isDarkTheme) async {
    try {
      final theme = await _themeRepo.changeTheme(isDarkTheme: isDarkTheme);
      state = theme.fold(
        (success) => success,
        (failure) => AppThemes.lightTheme,
      );
      state = isDarkTheme ? AppThemes.darkTheme : AppThemes.lightTheme;
    } catch (e) {
      state = AppThemes.lightTheme;
    }
  }
}
