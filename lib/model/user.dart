class UserModel {
  String? id;
  String? name;
  String? email;
  String? photo;
  UserModel({
    this.name,
    this.email,
    this.id,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
      'photo': photo,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] != null ? json['name'] as String : null,
      id: json['id'] != null ? json['id'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      photo: json['photo'] != null ? json['photo'] as String : null,
    );
  }
}
