import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_modelo.dart';
import '../services/api_service.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<Evento, BlocState> {
  final ApiService apiService;

  BlocBloc(this.apiService) : super(BlocInitial()) {
    on<CargarDatosEvento>((event, emit) async {
      emit(BlocLoading());
      try {
        final data = await apiService.fetchData();
        emit(BlocLoaded(data));
      } catch (e) {
        emit(BlocError("Error en Bloc: $e"));
      }
    });
  }
}
