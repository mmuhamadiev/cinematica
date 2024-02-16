part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetOnState extends InternetState {}

class InternetOffState extends InternetState {}