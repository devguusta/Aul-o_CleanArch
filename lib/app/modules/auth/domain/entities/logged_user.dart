import 'dart:convert';

class LoggedUser {
  final String name;
  final String email;
  LoggedUser({
    required this.name,
    required this.email,
  });

  LoggedUser copyWith({
    String? name,
    String? email,
  }) {
    return LoggedUser(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory LoggedUser.fromMap(Map<String, dynamic> map) {
    return LoggedUser(
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUser.fromJson(String source) => LoggedUser.fromMap(json.decode(source));

  @override
  String toString() => 'LoggedUser(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoggedUser &&
      other.name == name &&
      other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
