import 'dart:convert';

class UserFields{
  static final String id= 'id';
  static final String name ='name';
  static final String email= 'email';

static List <String> getFields() => [id, name, email];
}
class User {
  final int? id;
  final String name;
  final String email;
  const User(
{
  this.id,
  required this.name,
  required this.email,
}

  );
  User copy({
    int? id,
    String? name,
    String? email,
  }) =>
  User(
    id: id?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,

  );

static User fromJson(Map<String, dynamic> json) => User(
  id: jsonDecode(json[UserFields.id]),
  name: json[UserFields.name],  
  email: json[UserFields.email]
)
;
Map <String, dynamic> toJson() => {
  UserFields.id: id,
  UserFields.email: email,
  UserFields.name: name,
};
}