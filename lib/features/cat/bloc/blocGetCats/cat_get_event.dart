part of 'cat_get_bloc.dart';

@immutable
abstract class CatGetEvent {
  List<Object> get props => [];
}

class CatGetListEvent extends CatGetEvent {
  int? page;
  String? order;

  CatGetListEvent([this.page, this.order]);

  @override
  List<Object> get props => [];
}
