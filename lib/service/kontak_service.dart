import 'dart:io';

import 'package:http/http.dart' as http;
class KontakService {
  final String baseUrl = 'https://paml.tatiumy.com/api/';
  final String endpoint = 'people';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }
}