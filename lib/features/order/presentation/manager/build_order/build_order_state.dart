part of 'build_order_cubit.dart';

sealed class BuildOrderState {}

final class BuildOrderInitial extends BuildOrderState {}

final class OrderIndexChanged extends BuildOrderState {}
