class User_data {
  final int userId;
  final int id;
  final String name;
  final String roles;

  const User_data({
    required this.userId,
    required this.id,
    required this.name,
    required this.roles,
  });

  factory User_data.fromJson(Map<String, dynamic> json) {
    return User_data(
      userId: json['userId'],
      id: json['id'],
      name: json['name'],
      roles: json['roles'],
    );
  }
}
