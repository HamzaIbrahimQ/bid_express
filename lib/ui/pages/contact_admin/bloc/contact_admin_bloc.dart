import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_admin_event.dart';
part 'contact_admin_state.dart';

class ContactAdminBloc extends Bloc<ContactAdminEvent, ContactAdminState> {
  ContactAdminBloc() : super(ContactAdminInitial()) {
    on<ContactAdminEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
