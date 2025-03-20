import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiServiceUrl {
  static String get baseUrl {
    return dotenv.env['API_BASE_URL'] ?? '';
  }
}
