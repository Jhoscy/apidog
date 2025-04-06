import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

///Tag
@JsonSerializable()
class Tag {
  ///Tag ID
  @JsonKey(name: "id")
  String? id;

  ///Tag Name
  @JsonKey(name: "name")
  String? name;

  Tag({
    this.id,
    this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
