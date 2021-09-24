class GetContact {
    GetContact({
        this.id,
        this.name,
        this.phone,
        this.job,
        this.company,
        this.image,
        this.email,
    });

    int? id;
    String? name;
    String? phone;
    String? job;
    String? company;
    String? image;
    String? email;

    factory GetContact.fromJson(Map<String, dynamic> json) => GetContact(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        job: json["job"] == null ? null : json["job"],
        company: json["company"] == null ? null : json["company"],
        image: json["image"] == null ? null : json["image"],
        email: json["email"] == null ? null : json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "job": job == null ? null : job,
        "company": company == null ? null : company,
        "image": image == null ? null : image,
        "email": email == null ? null : email,
    };

    factory GetContact.fromMap(Map<String, dynamic> json) => new GetContact(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        company: json['company'],
        job: json['job'],
        image: json['image'],
      );

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'company': company,
      'job': job,
      'image': image,
    });
  }
}