part of 'firebase_cubit.dart';

@immutable
abstract class FirebaseState {}

class FirebaseInitial extends FirebaseState {}

class FirebaseLoading extends FirebaseState {}

class FirebaseAdded extends FirebaseState {}

class FirebaseDeleted extends FirebaseState {}
