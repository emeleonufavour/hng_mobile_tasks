import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  final String apiToken;

  EnvConfig({required this.apiToken});

  static Future<EnvConfig> initialize() async {
    await dotenv.load(fileName: '.env');

    return EnvConfig(
      apiToken: dotenv.env['API_TOKEN'] ?? '',
    );
  }
}
