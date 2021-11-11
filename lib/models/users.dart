import 'roles.dart';

class Users {
  final int? id;
  final String? email;
  final String? password;
  final String? fullname;
  final String? phone;
  final String? createdAt;
  final String? updatedAt;
  final Roles? roles;

  Users({this.id, this.email, this.password, this.fullname, this.phone, this.createdAt, this.updatedAt, this.roles});

  factory Users.fromJson(Map<String, dynamic> json) {

    return Users(
        id: json['id'] as int,
        email: json['email'] as String,
        password: json['password'] as String,
        fullname: json['fullname'] as String,
        phone: json['phone'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        roles: Roles.fromJson(json['Role']));
  }

  @override
  String toString() {
    return 'Users{name: $fullname, email: $email}';
  }
}
