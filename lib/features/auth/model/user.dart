class User {
  late final String id;
  late final String name;
  late final String email;
  late final String phone;
  late final String address;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
  
  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['_id'], 
      name: json['name'], 
      email: json['email'], 
      phone: json['phone'], 
      address: json['address'],
      );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    return data;
  }
}