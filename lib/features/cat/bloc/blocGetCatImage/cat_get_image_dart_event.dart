part of 'cat_get_image_dart_bloc.dart';

@immutable
abstract class CatGetImageDartEvent {
  @override
  List<Object> get props => [];
}

class CatGetImageEvent extends CatGetImageDartEvent {
  String idImage;
  CatGetImageEvent(this.idImage);

  @override
  List<Object> get props => [idImage];
}
