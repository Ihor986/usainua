import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState()) {
    on<ChangePage>((event, emit) {
      if (state.pageIndex == event.index) return;
      emit(NavigationState(pageIndex: event.index));
    });
  }
}
