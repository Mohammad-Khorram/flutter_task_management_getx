import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentCore {
  String getValue({required String key}) => dotenv.env[key]!;
}