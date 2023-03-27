import 'package:bloc/bloc.dart';
import 'package:claysys_portal/blocs/app_theme/theme_event.dart';
import 'package:claysys_portal/blocs/app_theme/theme_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(switchValue: false)) {

    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(switchValue: true));
    });

    on<SwitchOffEvent>((event, emit) {
      emit(SwitchState(switchValue: false));
    });
  }
}
