import 'package:adopt_pet_app/models/dog.dart';
import 'package:adopt_pet_app/services/dogs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dog_get_event.dart';
part 'dog_get_state.dart';

class DogGetBloc extends Bloc<DogGetEvent, DogGetState> {
  late DogsRepo apiDog;

  DogGetBloc() : super(DogGetInitialState()) {
    on<DogGetListEvent>(_dogGetEvent);
  }

  Future<void> _dogGetEvent(
      DogGetListEvent event, Emitter<DogGetState> emit) async {
    emit(DogGetProgressState());
    apiDog = DogsRepo();
    var result = await apiDog.getDogsList();
    result.fold(
        (success) => emit(DogGetSuccessState(success)),
        (failure) => emit(DogGetFailureState())
    );
  }
}
