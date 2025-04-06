import 'dart:math';

import 'package:apidog/domain/entities/pet.dart';
import 'package:apidog/presentation/providers/pet_provider.dart';
import 'package:apidog/presentation/screens/pet_detail_screen.dart';
import 'package:apidog/presentation/screens/pet_screen.dart';
import 'package:apidog/presentation/widgets/alert_dialog.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetItem extends StatelessWidget {
  const PetItem({super.key, required this.pet});

  final Pet pet;
  // Modify this to true if you want to see the pet detail in a standalone page
  final bool standalone = true;

  void managePetDetail(BuildContext context, Pet pet, String id) {
    final provider = Provider.of<ApiProvider>(context, listen: false);
    provider.fetchData(id, onSuccess: (pet) {
      Navigator.push(
        petScreenScaffoldKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => PetDetail(
            pet: pet,
            standalone: standalone,
          ),
        ),
      );
    }, onError: (e) => showPlatformSpecificAlert(petScreenScaffoldKey.currentContext!, message: e.toString()));
  }

  void _onTap(BuildContext context) {
    if (!standalone) {
      // Api Response 200: Valid ID
      managePetDetail(context, pet, pet.id.toString());
      // Api Response 400: Invalid ID supplied
      //managePetDetail(context, pet, 'DDD');
      // Api Response 404: Pet not found
      //managePetDetail(context, pet, '1?apidogResponseId=2989402');
    } else {
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
