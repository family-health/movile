import 'dart:convert';

ResponseApiModel responseApiFromJson(String str) => ResponseApiModel.fromJson(json.decode(str));

String responseApiToJson(ResponseApiModel data) => json.encode(data.toJson());

class ResponseApiModel<T> {
  late bool success;
  late String message;
  final T? data;

  ResponseApiModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResponseApiModel.fromJson(Map<String, dynamic> json) => ResponseApiModel(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}