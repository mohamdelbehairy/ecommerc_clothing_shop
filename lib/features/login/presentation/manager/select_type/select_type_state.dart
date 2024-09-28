part of 'select_type_cubit.dart';

sealed class SelectTypeState {}

final class SelectTypeInitial extends SelectTypeState {}
final class ChangeIndex extends SelectTypeState {
  
}
