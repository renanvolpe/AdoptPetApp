import 'package:adopt_pet_app/models/cat_model/cat.dart';
import 'package:adopt_pet_app/services/cats_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cat_get_event.dart';
part 'cat_get_state.dart';

class CatGetBloc extends Bloc<CatGetEvent, CatGetState> {
  late CatsRepo apiCat;

  CatGetBloc() : super(CatGetInitialState()) {
    on<CatGetListEvent>(_catGetEvent);
  }

  Future<void> _catGetEvent(
      CatGetListEvent event, Emitter<CatGetState> emit) async {
    emit(CatGetProgressState());
    apiCat = CatsRepo();
    var result = await apiCat.getCatsList( event.page ?? 0  , event.order ?? "ASC");
    result.fold(
        (success) => emit(CatGetSuccessState(success)),
        (failure) => emit(CatGetFailureState())
    );
  }
}
