import 'package:get/get.dart';
import 'package:watintake_dribble_design/models/exercise_model.dart';
import 'package:watintake_dribble_design/services/nutritionix_api_service.dart';

class ExerciseController extends GetxController {
  var exercises = Exercise(exercises: []).obs;
  var isLoading = true.obs;
  late final String? query;
  late final String? gender;
  late final String? height;
  late final String? weight;
  late final String? age;

  ExerciseController({this.query});

  @override
  void onInit() {
    super.onInit();
    if (query != null) {
      fetchExercise(query!);
    } else {
      isLoading(false);
      clearExercise();
    }
  }

  void fetchExercise(String query) async {
    try {
      isLoading(true);
      var exercisesTemp = await NutritionixService.fetchExercise(query, gender??'', weight??'', height??'', age??'');
      exercises.value = exercisesTemp;
    } finally {
      isLoading(false);
    }
  }

  void clearExercise() {
    exercises.value = Exercise(exercises: []);
  }
}
