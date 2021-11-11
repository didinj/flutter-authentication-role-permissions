class Permissions {
  final int? id;
  final String? permName;
  final String? permDescription;
  final String? createdAt;
  final String? updatedAt;

  Permissions({this.id, this.permName, this.permDescription, this.createdAt, this.updatedAt});

  factory Permissions.fromJson(Map<String, dynamic> json) {
    return Permissions(
        id: json['id'] as int,
        permName: json['perm_name'] as String,
        permDescription: json['perm_description'] as String,
        createdAt: json['createdAt'] as String,
        updatedAt: json['updatedAt'] as String);
  }

  @override
  String toString() {
    return '$permDescription';
  }
}