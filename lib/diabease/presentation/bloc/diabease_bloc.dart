import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sklite/ensemble/forest.dart';

part 'diabease_event.dart';
part 'diabease_state.dart';

class DiabeaseBloc extends Bloc<DiabeaseEvent, DiabeaseState> {
  DiabeaseBloc() : super(DiabeaseInitial()) {
    on<DiabeaseEvent>((event, emit) async {
      if (event is AnalyzeEvent) {
        await _onAnalyzeEvent(event, emit);
      }
    });
  }

  FutureOr<void> _onAnalyzeEvent(
      AnalyzeEvent event, Emitter<DiabeaseState> emit) async {
    emit(DiabeaseLoadingState());
    try {
      final result = event.randomForestClassifier.predict(event.data);
      emit(DiabeaseSuccessState(result: result));
    } on Exception catch (e) {
      emit(DiabeaseErrorState(message: e.toString()));
    }
  }
}
