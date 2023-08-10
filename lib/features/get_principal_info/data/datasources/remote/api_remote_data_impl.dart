import 'dart:convert';

import '../../models/citation_model.dart';
import 'api_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client client;

  ApiRemoteDataSourceImpl({required this.client});

  @override
  Future<CitationModel> getRemoteCitation() async {
    final url = Uri.parse('https://zenquotes.io/api/today');
    final result = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    try {
      if (result.statusCode == 200) {
        return CitationModel.fromJson(json.decode(result.body)[0] ?? '');
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
