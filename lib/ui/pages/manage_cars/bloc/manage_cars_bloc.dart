import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_cars_event.dart';
part 'manage_cars_state.dart';

class ManageCarsBloc extends Bloc<ManageCarsEvent, ManageCarsState> {
  ManageCarsBloc() : super(ManageCarsInitial()) {
    on<ManageCarsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
