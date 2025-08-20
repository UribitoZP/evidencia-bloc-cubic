import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit_cubit.dart';
import '../bloc/bloc_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cubit y Bloc en la misma vista")),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CubitCubit, CubitState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is Loaded) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (_, i) => ListTile(
                      title: Text(state.data[i].name),
                    ),
                  );
                }
                if (state is Error) {
                  return Center(child: Text(state.mensaje));
                }
                return const Center(child: Text("Cubit esperando datos..."));
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: BlocBuilder<BlocBloc, BlocState>(
              builder: (context, state) {
                if (state is BlocLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is BlocLoaded) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (_, i) =>
                        ListTile(title: Text(state.data[i].name ?? "sin nombre")),
                  );
                }
                if (state is BlocError) {
                  return Center(child: Text(state.mensaje));
                }
                return const Center(child: Text("Bloc esperando datos..."));
              },
            ),
          ),
        ],
      ),
    );
  }
}
