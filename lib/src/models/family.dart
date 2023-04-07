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
  
  Family({
    this.id,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.relation,
  });

  factory Family.fromJson(Map<String, dynamic> json) => Family(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        relation: json["relation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "relation": relation,
      };
}
