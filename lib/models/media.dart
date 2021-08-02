import 'package:json_annotation/json_annotation.dart';


part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media
{
  final String name;
  final String type;

  Media({required this.name, required this.type});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}