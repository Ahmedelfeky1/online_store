part of 'appauth_cubit.dart';

@immutable
sealed class AppauthState {}

final class AppauthInitial extends AppauthState {}

final class AppauthLoading extends AppauthState {}

final class AppauthSuccess extends AppauthState {}

final class AppauthError extends AppauthState {
  final String errorMessage;
  AppauthError({required this.errorMessage});
}
