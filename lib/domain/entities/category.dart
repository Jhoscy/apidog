import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

///Category
@JsonSerializable()
class Category {
  ///Category ID
  @JsonKey(name: "id", fromJson: _stringToInt)
  int? id;

  ///Category Name
  @JsonKey(name: "name")
  String? name;

  Category({
    this.id,
    this.name,
  });

  static int? _stringToInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
