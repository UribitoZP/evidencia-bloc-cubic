import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_modelo.dart';
import '../services/user_service.dart';

part 'cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  final UserService userService;

  CubitCubit(this.userService) : super(Initial());

  void loadData() async {
    emit(Loading());
    try {
      final data = await userService.fetchUsers();
      emit(Loaded(data));
    } catch (e) {
      emit(Error("Error en Cubit: $e"));
    }
  }
}
