import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/presentation/widgets/layout.dart';
import 'package:flutter/material.dart';

class PetDetail extends StatelessWidget {
  const PetDetail({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: AppBar(
        title: Text(pet.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          // Image of the Pet
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                pet.photoUrls[0],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Pet's Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              pet.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          // Pet's Status
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text(
              'Status: ${pet.status.name}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          // Pet's Tags
          if (pet.tags.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Wrap(
                spacing: 8.0, // Space between tags
                runSpacing: 4.0, // Space between lines of tags
                children: pet.tags.map((tag) {
                  return Chip(
                    label: Text(tag.name ?? ''),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                  );
                }).toList(),
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              pet.category.name!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
