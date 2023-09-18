import 'dart:convert';

FamilyMemberModel familyFromJson(String str) => FamilyMemberModel.fromJson(json.decode(str));

String familyToJson(FamilyMemberModel data) => json.encode(data.toJson());

class FamilyMemberModel {
  String? id;
  String? avatar;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? relation;
  String? userId;
  bool? isVerified;
  bool? isEmergency;

  FamilyMemberModel({
    this.id,
    this.avatar,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.relation,
    this.isVerified,
    this.isEmergency,
    this.userId,
  });

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) => FamilyMemberModel(
        id: json["id"],
        avatar: json["avatar"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        relation: json["relation"],
        isVerified: json["isVerified"],
        isEmergency: json["isEmergency"],
        userId: json["userId"],
      );

  static List<FamilyMemberModel> fromJsonList(List<dynamic> jsonList) {
    List<FamilyMemberModel> toList = [];

    for (var item in jsonList) {
      FamilyMemberModel order = FamilyMemberModel.fromJson(item);
      toList.add(order);
    }

    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
        "isVerified": isVerified,
        "isEmergency": isEmergency,
        "userId": userId,
      };

  Map<String, dynamic> toJsonForCreateFamily() => {
        "name": name,
        "avatar": avatar,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
        "userId": userId,
      };

  Map<String, dynamic> toJsonForUpdateFamily() => {
        "name": name,
        "avatar": avatar,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
        "userId": userId,
        "isEmergency": isEmergency,
      };
}
