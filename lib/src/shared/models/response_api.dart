import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi<T> {
  final bool? success;
  final String? message;
  final T data;

  const ResponseApi({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
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
