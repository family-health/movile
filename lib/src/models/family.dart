import 'dart:convert';

Family familyFromJson(String str) => Family.fromJson(json.decode(str));

String familyToJson(Family data) => json.encode(data.toJson());

class Family {
  String? id;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? relation;
  String? userId;
  bool? isVerified;

  Family({
    this.id,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.relation,
    this.isVerified,
    this.userId
  });

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        relation: json["relation"],
        isVerified: json["isVerified"],
        userId: json["userId"],
      );

  static List<Family> fromJsonList(List<dynamic> jsonList) {
    List<Family> toList = [];

    for (var item in jsonList) {
      Family order = Family.fromJson(item);
      toList.add(order);
    }

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
        "isVerified": isVerified,
        "userId": userId,
      };
  Map<String, dynamic> toJsonForCreateFamily() => {
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
        "userId": userId,
      };
}
