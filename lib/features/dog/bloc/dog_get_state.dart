part of 'dog_get_bloc.dart';

@immutable
abstract class DogGetState {
  @override
  List<Object> get props => [];
}

class DogGetInitialState extends DogGetState {}

class DogGetProgressState extends DogGetState {}

class DogGetSuccessState extends DogGetState {
  List<Dog> listDogs;

  DogGetSuccessState(this.listDogs);

  @override
  List<Object> get props => [listDogs];
}

class DogGetFailureState extends DogGetState {}
