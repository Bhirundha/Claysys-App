import 'package:bloc/bloc.dart';
import 'package:claysys_portal/models/imp_contacts.dart';
import 'package:meta/meta.dart';
part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsLoadedState(imp_contacts: contact));
}
