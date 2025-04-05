import 'package:apidog/presentation/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
              ]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                provider.isLoading
                    ? const CircularProgressIndicator()
                    : provider.petList.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              itemCount: provider.petList.length,
                              itemBuilder: (context, index) {
                                return Text(provider.petList[index].name);
                              },
                            ),
                          )
                        : const Text('No data fetched yet'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
