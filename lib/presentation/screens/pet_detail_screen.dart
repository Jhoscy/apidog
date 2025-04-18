import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/presentation/providers/pet_provider.dart';
import 'package:apidog/presentation/widgets/carousel.dart';
import 'package:apidog/presentation/widgets/carousel_indicators.dart';
import 'package:apidog/presentation/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> petDetailScaffoldKey = GlobalKey<ScaffoldState>();

class PetDetail extends StatefulWidget {
  const PetDetail({super.key, required this.pet, required this.standalone});

  final Pet pet;
  final bool standalone;
  @override
  State<PetDetail> createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  int _currentImageIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    return Layout(
      scaffoldKey: petDetailScaffoldKey,
      appBar: AppBar(
        title: Text(widget.pet.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: (provider.pet == null && !widget.standalone)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                // Image of the Pet
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(8.0),
                  child: Carousel(
                    images: provider.pet?.photoUrls ?? widget.pet.photoUrls,
                    onPageChanged: _onPageChanged,
                  ),
                ),
                CarouselIndicators(
                  imagesLength: provider.pet?.photoUrls.length ??
                      widget.pet.photoUrls.length,
                  currentIndex: _currentImageIndex,
                ),

                // Pet's Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    provider.pet?.name ?? widget.pet.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),

                // Pet's Status
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    'Status: ${provider.pet?.status.name ?? widget.pet.status.name}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                // Pet's Tags
                if (provider.pet?.tags.isNotEmpty ?? widget.pet.tags.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Wrap(
                      spacing: 8.0, // Space between tags
                      runSpacing: 4.0, // Space between lines of tags
                      children: (provider.pet?.tags ?? widget.pet.tags)
                          .map((tag) {
                        return Chip(
                          label: Text(tag.name ?? ''),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.1),
                        );
                      }).toList(),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    provider.pet?.category.name ?? widget.pet.category.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
    );
  }
}
