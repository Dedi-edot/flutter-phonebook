class FavModel {
  final int? id;
  final String name;
  final String phone;
  final String email;
  final String company;
  final String job;
  final String image;

  FavModel(
      {this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.company,
      required this.job,
      required this.image});

  factory FavModel.fromMap(Map<String, dynamic> json) => new FavModel(
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
