import 'dart:convert';

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dailyKcal,
    required this.dailyCarbsPct,
    required this.dailyFatPct,
    required this.dailyProteinPct,
    required this.timezone,
    required this.enableWeekdaySms,
    required this.enableReviewFoods,
    required this.oauths,
    required this.accountSetup,
    required this.defaultNutrient,
    required this.defaultNutrientValue,
    required this.birthYear,
    required this.heightCm,
    required this.weightKg,
    required this.gender,
    required this.measureSystem,
    required this.exerciseLevel,
    required this.pushEnabled,
    required this.weekdayRemindersEnabled,
    required this.weekendRemindersEnabled,
    required this.nutritionTopics,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final int dailyKcal;
  late final int dailyCarbsPct;
  late final int dailyFatPct;
  late final int dailyProteinPct;
  late final String timezone;
  late final int enableWeekdaySms;
  late final int enableReviewFoods;
  late final List<Oauths> oauths;
  late final String accountSetup;
  late final int defaultNutrient;
  late final int defaultNutrientValue;
  late final int birthYear;
  late final int heightCm;
  late final int weightKg;
  late final String gender;
  late final int measureSystem;
  late final int exerciseLevel;
  late final int pushEnabled;
  late final int weekdayRemindersEnabled;
  late final int weekendRemindersEnabled;
  late final List<int> nutritionTopics;
  
  User.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dailyKcal = json['daily_kcal'];
    dailyCarbsPct = json['daily_carbs_pct'];
    dailyFatPct = json['daily_fat_pct'];
    dailyProteinPct = json['daily_protein_pct'];
    timezone = json['timezone'];
    enableWeekdaySms = json['enable_weekday_sms'];
    enableReviewFoods = json['enable_review_foods'];
    oauths = List.from(json['oauths']).map((e)=>Oauths.fromJson(e)).toList();
    accountSetup = json['account_setup'];
    defaultNutrient = json['default_nutrient'];
    defaultNutrientValue = json['default_nutrient_value'];
    birthYear = json['birth_year'];
    heightCm = json['height_cm'];
    weightKg = json['weight_kg'];
    gender = json['gender'];
    measureSystem = json['measure_system'];
    exerciseLevel = json['exercise_level'];
    pushEnabled = json['push_enabled'];
    weekdayRemindersEnabled = json['weekday_reminders_enabled'];
    weekendRemindersEnabled = json['weekend_reminders_enabled'];
    nutritionTopics = List.castFrom<dynamic, int>(json['nutrition_topics']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['daily_kcal'] = dailyKcal;
    data['daily_carbs_pct'] = dailyCarbsPct;
    data['daily_fat_pct'] = dailyFatPct;
    data['daily_protein_pct'] = dailyProteinPct;
    data['timezone'] = timezone;
    data['enable_weekday_sms'] = enableWeekdaySms;
    data['enable_review_foods'] = enableReviewFoods;
    data['oauths'] = oauths.map((e)=>e.toJson()).toList();
    data['account_setup'] = accountSetup;
    data['default_nutrient'] = defaultNutrient;
    data['default_nutrient_value'] = defaultNutrientValue;
    data['birth_year'] = birthYear;
    data['height_cm'] = heightCm;
    data['weight_kg'] = weightKg;
    data['gender'] = gender;
    data['measure_system'] = measureSystem;
    data['exercise_level'] = exerciseLevel;
    data['push_enabled'] = pushEnabled;
    data['weekday_reminders_enabled'] = weekdayRemindersEnabled;
    data['weekend_reminders_enabled'] = weekendRemindersEnabled;
    data['nutrition_topics'] = nutritionTopics;
    return data;
  }
}

class Oauths {
  Oauths({
    required this.provider,
    required this.logPref,
  });
  late final String provider;
  late final int logPref;
  
  Oauths.fromJson(Map<String, dynamic> json){
    provider = json['provider'];
    logPref = json['log_pref'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['provider'] = provider;
    data['log_pref'] = logPref;
    return data;
  }
}

//user from json
User userFromJson(String str) => User.fromJson(json.decode(str));

//user to json
String userToJson(User data) => json.encode(data.toJson());