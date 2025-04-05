import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/usecases/fetch_api_data.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Pet> petList = [];
  Pet? pet;
  TextEditingController endpointController = TextEditingController(text: 'https://apidog.com/pet');
  final FetchApiData<Pet> fetchApiData;

  ApiProvider({required this.fetchApiData});

  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await fetchApiData("http://127.0.0.1:3658/m1/869737-850807-default/pet/1");
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
      final result = await fetchApiData.fetchList("http://127.0.0.1:3658/m1/869737-850807-default/pet/findByStatus?status=available");
      petList = result.data;
      debugPrint('Debug - Pet list: ${petList.length}');
    } catch (e) {
      debugPrint('Debug - Error: ${e.toString()}');
    }

    isLoading = false;
    notifyListeners();
  }
}