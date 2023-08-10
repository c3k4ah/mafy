// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:mafy/features/get_principal_info/data/models/citation_model.dart';

import 'api_local_data_source.dart';

class ApiLocalDataSourceImpl implements ApiLocalDataSource {
  @override
  Future<void> cacheLastCitation(
      {required CitationModel citationsToCache}) async {
    final shared = await SharedPreferences.getInstance();
    //save citation to local storage using shared_preferences

    try {
      await shared.setString(
          'lastCitation', citationsToCache.toJson().toString());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CitationModel> getLastCitation() async {
    final shared = await SharedPreferences.getInstance();
    //get citation from local storage using shared_preferences
    try {
      final jsonString = shared.getString('lastCitation');
      if (jsonString != null) {
        return Future.value(CitationModel.fromJson(jsonDecode(jsonString)));
      } else {
        throw Exception('No citation in cache');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
