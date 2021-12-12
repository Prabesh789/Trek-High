enum Environment {
  DEV,
  STAGE,
  PROD,
}

class Constants {
  static late Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGE:
        _config = _Config.stageConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String get whereAmI {
    return _config[_Config.WHERE_AM_I] as String;
  }
}

class _Config {
  static const WHERE_AM_I = 'WHERE_AM_I';

  static Map<String, dynamic> debugConstants = {
    WHERE_AM_I: 'dev',
  };

  static Map<String, dynamic> stageConstants = {
    WHERE_AM_I: 'stage',
  };

  static Map<String, dynamic> prodConstants = {
    WHERE_AM_I: 'production',
  };
}
