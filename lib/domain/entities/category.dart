import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

///Category
@JsonSerializable()
class Category {
  ///Category ID
  @JsonKey(name: "id")
  String? id;

  ///Category Name
  @JsonKey(name: "name")
  String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
