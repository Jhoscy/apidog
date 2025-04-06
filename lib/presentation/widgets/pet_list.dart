import 'package:apidog/presentation/providers/pet_provider.dart';
import 'package:apidog/presentation/widgets/pet_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetList extends StatelessWidget {
  const PetList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    return Expanded(
      child: ListView.separated(
        itemCount: provider.petList.length,
        itemBuilder: (context, index) {
          return PetItem(pet: provider.petList[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
      ),
    );
  }
}
