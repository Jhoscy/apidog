import 'package:apidog/data/models/api_response.dart';
import 'package:apidog/domain/repositories/api_repository.dart';

class FetchApiData<T> {
  final ApiRepository<T> repository;
  FetchApiData(this.repository);

  Future<ApiResponse<T>> call(String url) async {
    return await repository.fetchData(url);
  }

  Future<ApiResponse<List<T>>> fetchList(String url) async {
    return await repository.fetchList(url);
  }
}