class Person {
  final String name;
  final String username;
  final String email;
  final String phoneno;
  

  Person({this.name, this.username, this.email,this.phoneno});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phoneno: json['phone'],
    );
  }
}