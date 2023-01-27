import 'package:adopt_pet_app/services/cats_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_get_image_dart_event.dart';
part 'cat_get_image_dart_state.dart';

class CatGetImageBloc extends Bloc<CatGetImageEvent, CatGetImageState> {
  late CatsRepo apiCat;
  CatGetImageBloc() : super(CatGetImageInitial()) {
    on<CatGetImageEvent>(_catGetImageEvent);
  }

  Future<void> _catGetImageEvent(
      CatGetImageEvent event, Emitter<CatGetImageState> emit) async {
    emit(CatGetImageProgressState());
    apiCat = CatsRepo();
    var result = await apiCat.getCatImage(event.idImage);
    result.fold((success) => emit(CatGetImageSuccessState(success)),
        (failure) => emit(CatGetImageFailureState()));
  }
}
