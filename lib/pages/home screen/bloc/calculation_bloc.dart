import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  CalculationBloc() : super(CalculationState()) {
    on<ChangeCalculation>((event, emit) {
      // final bool isOnlyDelivery = event.isOnlyDelivery;
      emit(CalculationState(isOnlyDelivery: event.isOnlyDelivery));
    });
  }
}
