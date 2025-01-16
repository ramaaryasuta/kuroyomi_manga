import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://wholesomelist.com/api';

  final Dio dio = Dio();

  /// handle safe api call with error handling
  Future<Response<dynamic>> safeApiCall(
      Future<Response<dynamic>> Function() apiCall) async {
    try {
      final response = await apiCall();
      return response;
    } on DioException catch (e) {
      throw Exception('Network error occurred : $e');
    } catch (e) {
      throw Exception('Unexpected error occurred : $e');
    }
  }

  Future<Response> apiGetRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await safeApiCall(
        () => dio.get(path, queryParameters: queryParameters));
  }
}
