part of 'build_search_cubit.dart';

sealed class BuildSearchState {}

final class BuildSearchInitial extends BuildSearchState {}

final class CheckSearchSuccess extends BuildSearchState {}

final class ClearSearchSuccess extends BuildSearchState {}
