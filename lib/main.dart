import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp_flutterapp/ui/cubit/detailscubit.dart';
import 'package:todoapp_flutterapp/ui/cubit/homepagecubit.dart';
import 'package:todoapp_flutterapp/ui/cubit/newnotecubit.dart';
import 'package:todoapp_flutterapp/ui/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewNote_Cubit()),
        BlocProvider(create: (context) => DetailsPage_Cubit()),
        BlocProvider(create: (context) => HomePage_Cubit()),
      ],
      child: MaterialApp(
        title: 'To Do App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}