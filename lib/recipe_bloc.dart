import 'api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

abstract class RecipeEvent {}

class FetchRecipes extends RecipeEvent {
  final String query;
  FetchRecipes(this.query);
}

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<dynamic> recipes;
  RecipeLoaded(this.recipes);
}

class RecipeError extends RecipeState {
  final String message;
  RecipeError(this.message);
}

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final Dio _dio = Dio();
  final String _apiUrl = 'https://api.api-ninjas.com/v1/recipe';
  final String _apiKey = API;

  RecipeBloc() : super(RecipeInitial()) {
    on<FetchRecipes>((event, emit) async {
      emit(RecipeLoading());
      try {
        final response = await _dio.get(
          _apiUrl,
          queryParameters: {'query': event.query},
          options: Options(
            headers: {'X-Api-Key': _apiKey},
          ),
        );
        emit(RecipeLoaded(response.data));
      } catch (e) {
        emit(RecipeError('Ошибка при получении рецептов: $e'));
      }
    });
  }
}
