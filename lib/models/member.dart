class Member {
  String id;
  String name;
  String surname;
  String email;

  Member({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
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
