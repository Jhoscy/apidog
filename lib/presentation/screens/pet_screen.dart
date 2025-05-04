import 'package:apidog/presentation/providers/pet_provider.dart';
import 'package:apidog/presentation/widgets/layout.dart';
import 'package:apidog/presentation/widgets/pet_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> petScreenScaffoldKey = GlobalKey<ScaffoldState>();

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<PetScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<ApiProvider>(context, listen: false);
      provider.fetchPetList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);

    return Layout(
      scaffoldKey: petScreenScaffoldKey,
      appBar: AppBar(
        title: const Text('ApiDog Demo'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: provider.fetchPetList,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () => provider.fetchPetList(filteredByStatus: 'available'),
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              provider.isLoading
                  ? const CircularProgressIndicator()
                  : provider.petList.isNotEmpty
                      ? const PetList()
                      : const Text('No data fetched yet'),
            ],
          ),
        ),
      ),
    );
  }
}
