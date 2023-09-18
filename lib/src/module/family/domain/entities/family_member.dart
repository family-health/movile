import 'dart:convert';

class FamilyMember {
  String? id;
  String? avatar;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? relation;
  bool? isVerified;
  bool isEmergency;

  FamilyMember({
    this.id,
    this.avatar,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.relation,
    this.isVerified,
    required this.isEmergency
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "avatar": avatar,
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'relation': relation,
      'isVerified': isVerified,
      'isEmergency': isEmergency,
    };
  }

  factory FamilyMember.fromMap(Map<String, dynamic> map) {
    return FamilyMember(
      id: map['id'],
      avatar: map["avatar"],
      name: map['name'],
      lastName: map['lastName'],
      phone: map['phone'],
      email: map['email'],
      relation: map['relation'],
      isVerified: map['isVerified'],
      isEmergency: map['isEmergency']
    );
  }

  String toJson() => json.encode(toMap());

  factory FamilyMember.fromJson(String source) => FamilyMember.fromMap(json.decode(source));
}
