import 'package:apidog/data/datasource/api_service.dart';
import 'package:apidog/data/repositories/api_repository_impl.dart';
import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/domain/usecases/fetch_api_data.dart';
import 'package:apidog/presentation/providers/api_provider.dart';
import 'package:apidog/presentation/screens/api_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 252, 149),
  ),
);

Future<void> main() async {
  try {
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');
    print('Debug - Env: $env');
    await dotenv.load(fileName: './environments/.env.$env');
  } catch (e) {
    debugPrint('Debug - Error loading env: ${e.toString()}');
  }
  // Initialize the dependencies
  final petService = PetService();
  final apiRepository = PetRepositoryImpl(petService);
  final fetchApiData = FetchApiData<Pet>(apiRepository);
  runApp(MyApp(fetchApiData: fetchApiData));
}

class MyApp extends StatelessWidget {
  final FetchApiData<Pet> fetchApiData;
  const MyApp({super.key, required this.fetchApiData});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ApiProvider(fetchApiData: fetchApiData),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ApiDog Demo',
        theme: theme,
        home: ApiScreen(),
      ),
    );
  }
}
