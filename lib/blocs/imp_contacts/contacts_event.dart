part of 'contacts_bloc.dart';

@immutable
abstract class ContactsEvent {}

class ContactsInitialEvent extends ContactsEvent {}

class ContactsCallEvent extends ContactsEvent {}

class ContactsMessageEvent extends ContactsEvent {}