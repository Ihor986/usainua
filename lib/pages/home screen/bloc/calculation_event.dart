part of 'calculation_bloc.dart';

@immutable
abstract class CalculationEvent {}

class ChangeCalculation extends CalculationEvent {
  ChangeCalculation({this.isOnlyDelivery = false});
  final bool isOnlyDelivery;
}
