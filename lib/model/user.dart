import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User(this.id, this.name, this.email, this.password, this.address, this.type, this.token, {required address, required token});

 Map<String,dynamic> toMap(){
  return{
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "address": address,
    "type": type,
    "token": token
  };
 }

 factory User.fromMap(Map<String,dynamic> map){
  return User(
    id : map['id'] ?? '',
    name : map['name'] ?? '',
    email : map['email'] ?? '',
    password : map['password'] ?? '',
    address : map['address'] ?? '',
    type : map['type'] ?? '',
    token : map['token'] ?? '',
  );
 }

 String tojson = json.encode(toMap());

}