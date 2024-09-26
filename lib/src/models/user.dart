import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String userToJson(User data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class User {
  String? id; // Usar "?" para permitir valores nulos
  String? name;
  String? lastname;
  String? email;
  String? phone;
  String? password;
  String? sessionToken; // Consistencia en el nombre
  String? image;

  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
    this.phone,
    this.password,
    this.sessionToken,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"].toString(),
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        sessionToken: json["session_token"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "password": password,
        "session_token": sessionToken,
        "image": image,
      };
}
