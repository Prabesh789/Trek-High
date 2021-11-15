import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trek_high/app_setup/local_database/hive/hive_data_source.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/auth_token/auth_token.dart';

final localDataSource = Provider<LocalDataSource>((ref) => HiveDataSource());

abstract class LocalDataSource {
  Future<AuthToken?> getToken();
  Future<AuthToken?> cacheToken(AuthToken token);
  Future<void> deleteToken();
}
