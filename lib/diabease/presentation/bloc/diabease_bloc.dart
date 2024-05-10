import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diabease_event.dart';
part 'diabease_state.dart';

class DiabeaseBloc extends Bloc<DiabeaseEvent, DiabeaseState> {
  DiabeaseBloc() : super(DiabeaseInitial()) {
    on<DiabeaseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
