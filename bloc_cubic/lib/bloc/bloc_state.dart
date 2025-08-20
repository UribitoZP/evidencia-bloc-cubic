part of 'bloc_bloc.dart';

abstract class BlocState {}

class BlocInitial extends BlocState {}
class BlocLoading extends BlocState {}
class BlocLoaded extends BlocState {
  final List<Modelo> data;
  BlocLoaded(this.data);
}
class BlocError extends BlocState {
  final String mensaje;
  BlocError(this.mensaje);
}
