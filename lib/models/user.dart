class DataUser {
    DataUser({
        this.id,
        this.name,
        this.email,
        this.token,
    });

    int? id;
    String? name;
    String? email;
    final token;

    factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "token": token,
    };
}