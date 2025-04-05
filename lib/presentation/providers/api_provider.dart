import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/usecases/fetch_api_data.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  bool isLoading = false;
  String responseData = '';
  TextEditingController endpointController = TextEditingController(text: 'https://apidog.com/pet');
  final FetchApiData<Pet> fetchApiData;

  ApiProvider({required this.fetchApiData});

  Future<void> fetchData() async {
    isLoading = true;
    responseData = '';
    notifyListeners();

    try {
      final result = await fetchApiData(endpointController.text);
      responseData = 'Pet name: ${result.data.name}, ID: ${result.data.id}';
    } catch (e) {
      responseData = 'Error: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPetList() async {
    isLoading = true;
    responseData = '';
    notifyListeners();

    try {
      final result = await fetchApiData.fetchList(endpointController.text);
      responseData = result.data.map((pet) => '• ${pet.name} (ID: ${pet.id})').join('\n');
    } catch (e) {
      responseData = 'Error: ${e.toString()}';
    }

    isLoading = false;
    notifyListeners();
  }
}