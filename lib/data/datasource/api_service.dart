import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apidog/core/error/exceptions.dart';
import 'package:apidog/data/models/api_response.dart';
import 'package:apidog/domain/entities/pet.dart';

class PetService {
  Future<ApiResponse<Pet>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint('Debug - Response body: ${response.body}');
      return ApiResponse<Pet>(
        data: Pet.fromJson(decoded['data']),
        statusCode: decoded['code'],
      );
    } else {
      throw ServerException();
    }
  }

  Future<ApiResponse<List<Pet>>> fetchList(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint('Debug - Response body: ${response.body}');
      
      final data = decoded['data'] as List<dynamic>;
      
      return ApiResponse<List<Pet>>(
        data: data.map((item) => Pet.fromJson(item)).toList(),
        statusCode: decoded['code'],
      );
    } else {
      throw ServerException();
    }
  }
}