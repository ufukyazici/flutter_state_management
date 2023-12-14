import 'package:json_annotation/json_annotation.dart';

part 'map_model.g.dart';

@JsonSerializable(createToJson: false)
class MapModel {
  String? country;
  Detail? detail;
  double? lat;
  double? long;

  MapModel({this.country, this.detail, this.lat, this.long});

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return _$MapModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Detail {
  String? description;
  String? name;
  String? photoUrl;
  String? status;
  List<Tags>? tags;

  Detail({this.description, this.name, this.photoUrl, this.status, this.tags});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return _$DetailFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Tags {
  int? id;
  String? name;

  Tags({this.id, this.name});

  factory Tags.fromJson(Map<String, dynamic> json) {
    return _$TagsFromJson(json);
  }
}
