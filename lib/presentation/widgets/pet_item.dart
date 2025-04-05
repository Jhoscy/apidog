import 'dart:math';

import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/presentation/screens/pet_detail.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.pet});

  final Pet pet;

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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetDetail(pet: pet)),
          );
        },
      ),
    );
  }
}
