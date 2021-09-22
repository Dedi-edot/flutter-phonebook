class User {
int id;
String name, email, token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token
    });

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
  return User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      email: parsedJson['email'],
      token: parsedJson['token'],
    );
  }
}