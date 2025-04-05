import 'package:json_annotation/json_annotation.dart';

///Pet Sales Status
enum Status {
    @JsonValue("available")
    AVAILABLE,
    @JsonValue("pending")
    PENDING,
    @JsonValue("sold")
    SOLD
}