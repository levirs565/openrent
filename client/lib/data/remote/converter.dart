import 'package:json_annotation/json_annotation.dart';

class Iso8601Converter implements JsonConverter<DateTime, String> {
  const Iso8601Converter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
