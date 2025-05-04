import 'dart:convert';
import 'package:apidog/data/models/api_response.dart';
import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/usecases/fetch_api_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Pet> petList = [];
  Pet? pet;
  final baseUrl = dotenv.env['API_URL'];
  final jsonData = dotenv.env['JSON_DATA'];
  final FetchApiData<Pet> fetchApiData;

  ApiProvider({required this.fetchApiData});

  Future<void> fetchData(String id, {Function? onSuccess, Function? onError}) async {
    isLoading = true;
    pet = null;
    notifyListeners();
    try {
      if (jsonData == 'true') {
        // Read from JSON file
        final String response = await rootBundle.loadString('lib/data/mock/pet_response.json');
        final decoded = jsonDecode(response) as Map<String, dynamic>;
        pet = Pet.fromJson(decoded['data']);
        onSuccess?.call(pet);
      } else {
        // Fetch from API
        final result = await fetchApiData('$baseUrl/pet/$id');
        pet = result.data;
        onSuccess?.call(pet);
      }
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
      onError?.call(e);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPetList({Function? onSuccess, Function? onError, String? filteredByStatus}) async {
    isLoading = true;
    notifyListeners();

    try {
      if (jsonData == 'true') {
        // Read from JSON file
        final String response = await rootBundle.loadString('lib/data/mock/pets_list_response.json');
        final decoded = jsonDecode(response) as Map<String, dynamic>;
        final data = decoded['data'] as List<dynamic>;
        petList = data.map((pet) => Pet.fromJson(pet)).toList();
        onSuccess?.call(petList);
      } else {
        ApiResponse<List<Pet>> result;
        if (filteredByStatus == null) {
          result = await fetchApiData.fetchList('$baseUrl/pet/list');
        } else {
          result = await fetchApiData.fetchList('$baseUrl/pet/findByStatus?status=$filteredByStatus');
        }
        petList = result.data;
        onSuccess?.call(petList);
      }
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
      onError?.call(e);
    }

    isLoading = false;
    notifyListeners();
  }
}