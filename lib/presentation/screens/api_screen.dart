import 'dart:convert';
import 'package:apidog/presentation/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('ApiDog Demo'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
                TextField(
                  controller: provider.endpointController,
                  decoration: const InputDecoration(
                    labelText: 'API Endpoint',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: provider.fetchData,
                  child: const Text('Fetch Data'),
                ),
                const SizedBox(height: 20),
                provider.isLoading
                    ? const CircularProgressIndicator()
                    : provider.responseData.isNotEmpty
                        ? Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SelectableText(
                                _formatJson(provider.responseData),
                                style: const TextStyle(
                                    fontSize: 14, fontFamily: 'monospace'),
                              ),
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

  String _formatJson(String jsonString) {
    try {
      final jsonObject = json.decode(jsonString);
      return const JsonEncoder.withIndent('  ').convert(jsonObject);
    } catch (e) {
      debugPrint('Invalid JSON: $e');
      return 'Invalid JSON: $jsonString';
    }
  }
}
