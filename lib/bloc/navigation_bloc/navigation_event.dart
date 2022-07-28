part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class ChangePage extends NavigationEvent {
  ChangePage({required this.index});
  final int index;
}
