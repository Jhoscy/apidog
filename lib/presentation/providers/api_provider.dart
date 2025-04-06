import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/usecases/fetch_api_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Pet> petList = [];
  Pet? pet;
  final baseUrl = dotenv.env['API_URL'];
  final FetchApiData<Pet> fetchApiData;

  ApiProvider({required this.fetchApiData});

  Future<void> fetchData(String id, {Function? onSuccess, Function? onError}) async {
    isLoading = true;
    pet = null;
    notifyListeners();
    try {
      final result = await fetchApiData('$baseUrl/pet/$id');
      pet = result.data;
      onSuccess?.call(pet);
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
      onError?.call(e);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPetList({Function? onSuccess, Function? onError}) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await fetchApiData.fetchList('$baseUrl/pet/findByStatus?status=available');
      petList = result.data;
      onSuccess?.call(petList);
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
      onError?.call(e);
    }

    isLoading = false;
    notifyListeners();
  }
}