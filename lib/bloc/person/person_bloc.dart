import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/bloc/person/person_state.dart';
import 'package:flutter_bloc_practice/models/person.dart';

import 'person_event.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonStateInitial()) {
    on<PersonEventLoad>((event, emit) async {
      emit(PersonStateLoading());
      final url = event.url;
      final personList = fetchPersons(url: url);
      emit(PersonStateLoaded(persons: await personList));
    });
    
  }
}
