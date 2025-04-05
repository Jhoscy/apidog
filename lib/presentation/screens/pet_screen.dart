import 'package:apidog/presentation/providers/api_provider.dart';
import 'package:apidog/presentation/widgets/layout.dart';
import 'package:apidog/presentation/widgets/pet_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        title: const Text('ApiDog Demo'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: provider.fetchPetList,
            icon: const Icon(Icons.refresh),
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
