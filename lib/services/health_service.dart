import 'dart:convert';
import 'package:http/http.dart' as http;

class HealthService {
  final String _baseUrl = 'https://api.publichealthapi.com/healthtips';

  Future<List<dynamic>> fetchHealthTips() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load health tips');
    }
  }
}
