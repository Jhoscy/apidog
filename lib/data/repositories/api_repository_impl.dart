import 'package:apidog/core/error/exceptions.dart';
import 'package:apidog/data/datasource/api_service.dart';
import 'package:apidog/data/models/api_response.dart';
import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/repositories/api_repository.dart';

class PetRepositoryImpl implements ApiRepository<Pet> {
  final PetService petService;
  PetRepositoryImpl(this.petService);

  @override
  Future<ApiResponse<Pet>> fetchData(String url) async {
    try {
      return await petService.fetchData(url);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ApiResponse<List<Pet>>> fetchList(String url) async {
    try {
      return await petService.fetchList(url);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}