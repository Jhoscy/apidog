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

    static int? _stringToInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is String) return int.tryParse(value);
      return null;
    }

    factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

    Map<String, dynamic> toJson() => _$TagToJson(this);
}