import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseUrl = dotenv.env['API_URL'] ?? 'BASE_URL was not provided';
  static String apiKey = dotenv.env['API_KEY'] ?? 'API_KEY was not provided';
}
