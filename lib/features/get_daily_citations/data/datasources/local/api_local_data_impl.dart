import 'package:mafy/features/get_daily_citations/data/models/citation_model.dart';

import 'api_local_data_source.dart';
import 'package:http/http.dart' as http;

class ApiRemoteDataSourceImpl implements ApiRemoteDataSource {
  final http.Client client;

  ApiRemoteDataSourceImpl({required this.client});

  @override
  Future<CitationModel> getRemoteCitation() {
    throw UnimplementedError();
  }
}
