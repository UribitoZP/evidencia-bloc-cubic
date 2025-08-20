import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit_cubit.dart';
import 'bloc/bloc_bloc.dart';
import 'services/api_service.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitApi = ApiService("https://jsonplaceholder.typicode.com/users");
    final blocApi = ApiService("https://jsonplaceholder.typicode.com/posts");

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CubitCubit(cubitApi)..loadData()),
        BlocProvider(create: (context) => BlocBloc(blocApi)..add(CargarDatosEvento())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Cubit y Bloc Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
