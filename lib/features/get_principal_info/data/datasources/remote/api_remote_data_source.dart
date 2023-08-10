import '../../models/citation_model.dart';

abstract class ApiRemoteDataSource {
  Future<CitationModel> getRemoteCitation();
}
