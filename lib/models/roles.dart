import 'permissions.dart';

class Roles {
  final int? id;
  final String? roleName;
  final String? roleDescription;
  final String? createdAt;
  final String? updatedAt;
  final List<Permissions>? permissions;

  Roles({this.id, this.roleName, this.roleDescription, this.createdAt, this.updatedAt, this.permissions});
  // Roles({this.id, this.roleName, this.roleDescription, this.createdAt, this.updatedAt});

  factory Roles.fromJson(Map<String, dynamic> json) {
    var list = json['permissions'] as List;
    List<Permissions> permissionList = list.map((i) => Permissions.fromJson(i)).toList();

    return Roles(
        id: json['id'] as int,
        roleName: json['role_name'] as String,
        roleDescription: json['role_description'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String,
        permissions: permissionList);
  }

  @override
  String toString() {
    return 'Roles{role: $roleName}';
  }
}
