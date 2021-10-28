import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trek_high/app/entities/failure.dart';
import 'package:trek_high/core/theme/infrastructure/entities/theme_palatte.dart';

final themeRepository = Provider<ThemeRepositoryImpl>((ref) {
  return ThemeRepository();
});

abstract class ThemeRepositoryImpl {
  Future<Either<ThemeData, Failure>> fetchTheme();
  Future<Either<ThemeData, Failure>> changeTheme({
    required bool isDarkTheme,
  });
}

class ThemeRepository implements ThemeRepositoryImpl {
  @override
  Future<Either<ThemeData, Failure>> fetchTheme() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      final isDarkTheme = prefs.getBool('isDarkTheme');
      return Left(
        isDarkTheme != null && isDarkTheme
            ? AppThemes.darkTheme
            : AppThemes.lightTheme,
      );
    } catch (e) {
      return const Right(
        Failure(
          errorMessage: 'couldn\'t update theme',
        ),
      );
    }
  }

  @override
  Future<Either<ThemeData, Failure>> changeTheme({
    required bool isDarkTheme,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setBool('isDarkTheme', isDarkTheme);
      return Left(
        isDarkTheme ? AppThemes.darkTheme : AppThemes.lightTheme,
      );
    } catch (e) {
      return const Right(
        Failure(
          errorMessage: 'couldn\'t update theme',
        ),
      );
    }
  }
}
