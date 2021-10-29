import 'package:trek_high/app_setup/flavor_setup/app_config.dart';
import 'package:trek_high/main.dart';

void main() async {
  Constants.setEnvironment(Environment.PROD);

  await initializeApp();
}
