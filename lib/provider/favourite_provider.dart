import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier(): super([]);
  //method to edit the data
  bool toggleMealFavoriteStatus(Meal meal){
    final isExisting = state.contains(meal);
    if(isExisting){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =StateNotifierProvider<FavouriteMealsNotifier, List<Meal> >((ref){
  return FavouriteMealsNotifier();
});