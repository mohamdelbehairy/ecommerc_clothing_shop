part of 'tell_us_cubit.dart';

sealed class TellUsState {}

final class TellUsInitial extends TellUsState {}

final class ChangeIndex extends TellUsState {}

final class PickYearSuccess extends TellUsState {}
