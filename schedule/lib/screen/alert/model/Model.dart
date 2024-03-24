import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  String? label;
  String? datetime;

  Model({
    required this.label,
    required this.datetime,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["label"],
        datetime: json["datetime"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "datetime": datetime,
      };
}
