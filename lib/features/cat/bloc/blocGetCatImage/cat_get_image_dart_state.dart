part of 'cat_get_image_dart_bloc.dart';

@immutable
abstract class CatGetImageState {
  @override
  List<Object> get props => [];
}

class CatGetImageInitial extends CatGetImageState {}

class CatGetImageProgressState extends CatGetImageState {}

class CatGetImageSuccessState extends CatGetImageState {
  String urlImage;

  CatGetImageSuccessState(this.urlImage);

  @override
  List<Object> get props => [urlImage];
}

class CatGetImageFailureState extends CatGetImageState {}
