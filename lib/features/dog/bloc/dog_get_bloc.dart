import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dog_get_event.dart';
part 'dog_get_state.dart';

class DogGetBloc extends Bloc<DogGetEvent, DogGetState> {
  DogGetBloc() : super(DogGetInitialState()) {
    on<DogGetListEvent>(_dogGetEvent);
  }
  
  Future<void> _dogGetEvent(DogGetListEvent event, Emitter<DogGetState> emit) async{
    emit(DogGetProgressState());
    //get dogs
    

  }

  
}
