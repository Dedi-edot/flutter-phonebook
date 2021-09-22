class FavContact {
  final int? id;
  final String name;
  final String phone;
  final String? email;
  final String? company;
  final String? job;

  FavContact(
      {
      required this.id, 
      required this.name,
      required this.phone,
      required this.email,
      required this.company,
      required this.job});

  factory FavContact.fromMap(Map<String, dynamic> json) => new FavContact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      company: json['company'],
      job: json['job']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'company': company,
      'job': job,
    };
  }
}
