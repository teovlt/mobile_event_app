class User {
  String id;
  String name;
  String surname;
  String email;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    email: json['email'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'surname': surname,
    'email': email,
  };
}
