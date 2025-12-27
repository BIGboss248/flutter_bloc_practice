import 'package:flutter/foundation.dart';

@immutable
abstract class PersonEvent {}

@immutable
class PersonEventLoad extends PersonEvent {
  final String url;
  PersonEventLoad({required this.url});
}
