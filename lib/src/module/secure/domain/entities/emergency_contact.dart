import 'package:app/src/module/family/domain/entities/family_member.dart';

class EmergencyContact {
  String? id;
  String? avatar;
  String? name;
  String? lastName;
  String? phone;
  String? email;
  String? relation;
  bool? isVerified;
  bool? isEmergency;

  EmergencyContact({
    this.id,
    this.avatar,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.relation,
    this.isVerified,
    this.isEmergency,
  });

  // factory FamilyMember.fromJson(String source) => FamilyMember.fromMap(json.decode(source));

  factory EmergencyContact.fromFamilyMember(FamilyMember model) => EmergencyContact(
    avatar: model.avatar,
    email: model.email,
    id: model.id,
    isVerified: model.isVerified,
    lastName: model.lastName,
    name: model.name,
    phone: model.phone,
    relation: model.relation,
    isEmergency: model.isEmergency
  );
}
