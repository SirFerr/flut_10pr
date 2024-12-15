import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_bloc.dart';
import 'recipe_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рецепты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => RecipeBloc(),
        child: const RecipeListScreen(),
      ),
    );
  }
}