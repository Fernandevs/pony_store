class User {
  final String id;
  final String email;
  final String fullName;
  final List<String> roles;
  final String token;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.roles,
    required this.token,
  });

  User copyWith({
    String? id,
    String? email,
    String? fullName,
    List<String>? roles,
    String? token,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        roles: roles ?? this.roles,
        token: token ?? this.token,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'fullName': fullName,
        'roles': roles,
        'token': token,
      };

  bool get isAdmin => roles.contains('admin');
}
