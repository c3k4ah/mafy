import '../../models/citation_model.dart';

abstract class ApiLocalDataSource {
  Future<CitationModel> getLastCitation();
  Future<void> cacheLastCitation({required CitationModel citationsToCache});
}
