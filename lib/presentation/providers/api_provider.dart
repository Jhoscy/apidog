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

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await fetchApiData('$baseUrl/pet/1');
      pet = result.data;
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPetList() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await fetchApiData.fetchList('$baseUrl/pet/findByStatus?status=available');
      petList = result.data;
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }
}