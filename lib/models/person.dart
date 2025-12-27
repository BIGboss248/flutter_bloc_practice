import 'dart:convert';

import 'package:http/http.dart' as http;

/// Person object
/// [name]
/// [age]
class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  Person.fromMap(Map<String, dynamic> map)
    : name = map['name'],
      age = map['age'];

  @override
  String toString() {
    return "Person(name: $name, age: $age)";
  }
}

/// gets a URL and returns a Iterable of persons
Future<Iterable<Person>> fetchPersons({required String url}) => http
    .get(Uri.parse(url))
    .then((resp) => resp.body)
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromMap(e)));
