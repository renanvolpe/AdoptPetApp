import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_get_image_dart_event.dart';
part 'cat_get_image_dart_state.dart';

class CatGetImageDartBloc extends Bloc<CatGetImageDartEvent, CatGetImageDartState> {
  CatGetImageDartBloc() : super(CatGetImageDartInitial()) {
    on<CatGetImageDartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
