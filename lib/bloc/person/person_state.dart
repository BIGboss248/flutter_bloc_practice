import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_practice/models/person.dart';

@immutable
abstract class PersonState {}

@immutable
class PersonStateInitial extends PersonState {}

@immutable
class PersonStateLoading extends PersonState {}

@immutable
class PersonStateLoaded extends PersonState {
  final Iterable<Person> persons;
  PersonStateLoaded({required this.persons});
}
