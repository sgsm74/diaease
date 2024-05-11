part of 'diabease_bloc.dart';

@immutable
sealed class DiabeaseEvent {}

final class AnalyzeEvent extends DiabeaseEvent {
  AnalyzeEvent({
    required this.data,
    required this.randomForestClassifier,
  });
  final List<double> data;
  final RandomForestClassifier randomForestClassifier;
}
