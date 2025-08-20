part of 'cubit_cubit.dart';

abstract class CubitState {}

class Initial extends CubitState {}
class Loading extends CubitState {}
class Loaded extends CubitState {
  final List<UserModel> data;
  Loaded(this.data);
}
class Error extends CubitState {
  final String mensaje;
  Error(this.mensaje);
}
