import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_modelo.dart';
import '../services/api_service.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  final ApiService apiService;

  CubitCubit(this.apiService) : super(Initial());

  void loadData() async {
    emit(Loading());
    try {
      final data = await apiService.fetchData();
      emit(Loaded(data));
    } catch (e) {
      emit(Error("Error: $e"));
    }
  }
}

