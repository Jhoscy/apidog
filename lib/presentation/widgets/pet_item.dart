import 'dart:math';

import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/presentation/providers/api_provider.dart';
import 'package:apidog/presentation/screens/pet_detail.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.pet});

  final Pet pet;
  // Modify this to true if you want to see the pet detail in a standalone page
  final bool standalone = false;

  void _onTap(BuildContext context) {
    if (!standalone) {
      final provider = Provider.of<ApiProvider>(context, listen: false);
      provider.fetchData(pet.id.toString());
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDetail(
          pet: pet,
          standalone: standalone,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final randomIndex = Random().nextInt(pet.photoUrls.length);
    return ClayContainer(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: 20,
      height: 75,
      curveType: CurveType.convex,
      child: ListTile(
        title: Text(pet.name),
        subtitle: Text(pet.tags[0].name ?? ''),
        leading: CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(pet.photoUrls[randomIndex]),
        ),
        trailing: Text(pet.status.name.toLowerCase()),
        isThreeLine: true,
        onTap: () => _onTap(context),
      ),
    );
  }
}
