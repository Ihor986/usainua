// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAuth {
  final String? name;
  final String? email;
  final String? password;
  final bool? isEmailVerify;
  final String? photoUrl;
  final String? phoneNumber;
  final String id;
  UserAuth({
    this.name,
    this.email,
    this.password,
    this.isEmailVerify,
    this.photoUrl,
    this.phoneNumber,
    required this.id,
  });

  UserAuth copyWith({
    String? name,
    String? email,
    String? password,
    bool? isEmailVerify,
    String? photoUrl,
    String? phoneNumber,
    String? id,
  }) {
    return UserAuth(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailVerify: isEmailVerify ?? this.isEmailVerify,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'isEmailVerify': isEmailVerify,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'id': id,
    };
  }

  factory UserAuth.fromMap(Map<String, dynamic> map) {
    return UserAuth(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      isEmailVerify:
          map['isEmailVerify'] != null ? map['isEmailVerify'] as bool : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAuth.fromJson(String source) =>
      UserAuth.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAuth(name: $name, email: $email, password: $password, isEmailVerify: $isEmailVerify, photoUrl: $photoUrl, phoneNumber: $phoneNumber, id: $id)';
  }

  @override
  bool operator ==(covariant UserAuth other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.isEmailVerify == isEmailVerify &&
        other.photoUrl == photoUrl &&
        other.phoneNumber == phoneNumber &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        isEmailVerify.hashCode ^
        photoUrl.hashCode ^
        phoneNumber.hashCode ^
        id.hashCode;
  }
}
