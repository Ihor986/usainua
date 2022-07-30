part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class ChangePage extends NavigationEvent {
  ChangePage({required this.index});
  final int index;
}
