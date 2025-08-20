import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_bloc.dart';
import '../cubit/cubit_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foro UriBIT-os"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Column(
        children: [
          // Cubit (Usuarios)
          Expanded(
            child: BlocBuilder<CubitCubit, CubitState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is Loaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: state.data.length,
                    itemBuilder: (context, i) {
                      final user = state.data[i];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: Text(user.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(user.email),
                        ),
                      );
                    },
                  );
                }
                if (state is Error) {
                  return Center(child: Text(state.mensaje));
                }
                return const Center(child: Text("Cubit esperando datos..."));
              },
            ),
          ),

          const Divider(thickness: 2),

          // Bloc (Posts)
          Expanded(
            child: BlocBuilder<BlocBloc, BlocState>(
              builder: (context, state) {
                if (state is BlocLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is BlocLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: state.data.length,
                    itemBuilder: (_, i) {
                      final post = state.data[i];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: const Icon(Icons.article_outlined,
                              color: Colors.blue),
                          title: Text(post.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(post.body,
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                      );
                    },
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
