part of 'dog_get_bloc.dart';

@immutable
abstract class DogGetState {}

class DogGetInitialState extends DogGetState {}
class DogGetProgressState extends DogGetState {}
class DogGetSuccessState extends DogGetState {}
class DogGetFailureState extends DogGetState {}