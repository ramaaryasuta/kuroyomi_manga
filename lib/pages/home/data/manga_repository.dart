import 'dart:developer';

import '../../../core/utils/api_path.dart';
import '../../../core/utils/dio_client.dart';
import 'manga_model.dart';

class MangaRepository {
  Future<List<MangaModel>> fetchMangaList() async {
    try {
      final response = await DioClient().apiGetRequest(path: APiPath.allList);
      if (response.statusCode != 200) return [];
      var mangaList = (response.data['table'] as List)
          .map((e) => MangaModel.fromJson(e))
          .toList();
      return mangaList;
    } catch (e) {
      log('fetchMangaList error: $e');
      throw Exception('Unexpected error occurred : $e');
    }
  }
}
