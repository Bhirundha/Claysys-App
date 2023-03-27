part of 'contacts_bloc.dart';

@immutable
abstract class ContactsState {}

class ContactsInitialState extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsLoadedState extends ContactsState{
  List<Contact> imp_contacts = [];
  ContactsLoadedState({required this.imp_contacts});
}

class ContactsErrorState extends ContactsState {}