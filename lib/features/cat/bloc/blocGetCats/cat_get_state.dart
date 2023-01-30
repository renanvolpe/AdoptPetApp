part of 'cat_get_bloc.dart';

@immutable
abstract class CatGetState {
  @override
  List<Object> get props => [];
}

class CatGetInitialState extends CatGetState {}

class CatGetProgressState extends CatGetState {}

class CatGetSuccessState extends CatGetState {
  List<Cat> listCats;

  CatGetSuccessState(this.listCats);

  @override
  List<Object> get props => [listCats];
}



class CatGetFailureState extends CatGetState {}
