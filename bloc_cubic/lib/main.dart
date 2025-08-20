import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_bloc.dart';
import 'cubit/cubit_cubit.dart';
import 'pages/home_page.dart';
import 'services/user_service.dart';
import 'services/post_servicie.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = UserService("https://jsonplaceholder.typicode.com/users");
    final postService = PostService("https://jsonplaceholder.typicode.com/posts");

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CubitCubit(userService)..loadData()),
        BlocProvider(create: (context) => BlocBloc(postService)..add(CargarDatosEvento())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
