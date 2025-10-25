class UserModel {
  final String id;
  final String name;
  final String email;
  final String role; // customer, supplier, admin
  final bool verified;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.verified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        role: json['role'],
        verified: json['verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
        'verified': verified,
      };
}
