import 'package:apidog/data/models/api_response.dart';

abstract class ApiRepository<T> {
  Future<ApiResponse<T>> fetchData(String url);
  Future<ApiResponse<List<T>>> fetchList(String url);
}