part of 'diabease_bloc.dart';

@immutable
sealed class DiabeaseState {}

final class DiabeaseInitial extends DiabeaseState {}

final class DiabeaseLoadingState extends DiabeaseState {}

final class DiabeaseSuccessState extends DiabeaseState {
  DiabeaseSuccessState({required this.result});

  final int result;
}

final class DiabeaseErrorState extends DiabeaseState {
  DiabeaseErrorState({required this.message});

  final String message;
}
