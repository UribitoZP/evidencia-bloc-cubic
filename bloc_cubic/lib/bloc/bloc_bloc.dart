import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/post_modelo.dart';
import '../services/post_servicie.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<Evento, BlocState> {
  final PostService postService;

  BlocBloc(this.postService) : super(BlocInitial()) {
    on<CargarDatosEvento>((event, emit) async {
      emit(BlocLoading());
      try {
        final data = await postService.fetchPosts();
        emit(BlocLoaded(data));
      } catch (e) {
        emit(BlocError("Error en Bloc: $e"));
      }
    });
  }
}
