import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_bloc.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепты'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Поиск рецептов',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                BlocProvider.of<RecipeBloc>(context).add(FetchRecipes(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecipeLoaded) {
                  return ListView.builder(
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = state.recipes[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  recipe['title'] ?? 'Без названия',
                                  textAlign: TextAlign.start,
                                ),
                                subtitle: Text(
                                  recipe['ingredients']?.replaceAll('|', '\n') ?? 'Нет ингредиентов',
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is RecipeError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('Введите запрос для поиска рецептов.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
