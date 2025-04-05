import 'package:apidog/domain/entities/category.dart';
import 'package:apidog/domain/entities/tag.dart';
import 'package:apidog/domain/enums/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

///Pet
@JsonSerializable()
class Pet {
  ///group
  @JsonKey(name: "category")
  Category category;

  ///Pet ID
  @JsonKey(name: "id")
  int id;

  ///name
  @JsonKey(name: "name")
  String name;

  ///image URL
  @JsonKey(name: "photoUrls")
  List<String> photoUrls;

  ///Pet Sales Status
  @JsonKey(name: "status")
  Status status;

  ///tag
  @JsonKey(name: "tags")
  List<Tag> tags;

  Pet({
    required this.category,
    required this.id,
    required this.name,
    required this.photoUrls,
    required this.status,
    required this.tags,
  });

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  Map<String, dynamic> toJson() => _$PetToJson(this);
}
