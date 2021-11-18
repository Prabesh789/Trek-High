import 'dart:developer';
import 'package:trek_high/app_setup/local_database/hive/hive_const.dart';
import 'package:trek_high/app_setup/local_database/hive/hive_setup.dart';
import 'package:trek_high/app_setup/local_database/local_data_source.dart';
import 'package:trek_high/features/auth/infrastructure/entities/response/auth_token/auth_token.dart';

class HiveDataSource implements LocalDataSource {
  @override
  Future<AuthToken?> cacheToken(AuthToken token) async {
    try {
      final hiveAuthBox = await openBox(hiveTokenBox);

      await hiveAuthBox.put('token', token);

      return token;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthToken?> getToken() async {
    try {
      final hiveAuthBox = await openBox(hiveTokenBox);

      final token = await hiveAuthBox.get('token') as AuthToken;
      return token;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      final response = await getToken();
      final authToken = AuthToken(fcmToken: response?.fcmToken);
      await cacheToken(authToken);
    } catch (e) {
      log(e.toString());
    }
  }
}
