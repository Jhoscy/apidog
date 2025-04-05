// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrls:
          (json['photoUrls'] as List<dynamic>).map((e) => e as String).toList(),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'category': instance.category,
      'id': instance.id,
      'name': instance.name,
      'photoUrls': instance.photoUrls,
      'status': _$StatusEnumMap[instance.status]!,
      'tags': instance.tags,
    };

const _$StatusEnumMap = {
  Status.AVAILABLE: 'available',
  Status.PENDING: 'pending',
  Status.SOLD: 'sold',
};
