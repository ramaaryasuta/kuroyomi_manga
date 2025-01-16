import 'dart:developer';

import '../../../core/utils/api_path.dart';
import '../../../core/utils/dio_client.dart';
import 'licensed_manga_model.dart';

class LicensedRepository {
  Future<List<LicensedMangaModel>> fetchLicensedMangaList() async {
    try {
      final response =
          await DioClient().apiGetRequest(path: APiPath.licensedList);
      if (response.statusCode != 200) return [];
      var mangaList = (response.data['table'] as List)
          .map((e) => LicensedMangaModel.fromJson(e))
          .toList();
      return mangaList;
    } catch (e) {
      log('fetchMangaList error: $e');
      throw Exception('Unexpected error occurred : $e');
    }
  }
}
