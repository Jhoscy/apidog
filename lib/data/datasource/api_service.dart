import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apidog/core/error/exceptions.dart';
import 'package:apidog/data/models/api_response.dart';
import 'package:apidog/domain/entities/pet.dart';

class PetService {
  Future<ApiResponse<Pet>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      print('Debug - Response body: ${response.body}');
      print('Debug - Decoded data: ${decoded['data']}');
      return ApiResponse<Pet>(
        data: Pet.fromJson(decoded['data']),
        // message: decoded['message'],
        // statusCode: decoded['statusCode'],
      );
    } else {
      throw ServerException();
    }
  }

  Future<ApiResponse<List<Pet>>> fetchList(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      print('Debug - Response body: ${response.body}');
      print('Debug - Decoded data: ${decoded['data']}');
      final petList = (decoded['data'] as List)
          .map((item) {
            print('Debug - Processing item: $item');
            return Pet.fromJson(item);
          })
          .toList();
      return ApiResponse<List<Pet>>(
        data: petList,
        message: decoded['message'],
        statusCode: decoded['statusCode'],
      );
    } else {
      throw ServerException();
    }
  }
}