import 'dart:convert';

import 'package:watintake_dribble_design/models/photo_model.dart';

class Exercise {
  Exercise({
    required this.exercises,
  });
  late final List<Exercises> exercises;
  
  Exercise.fromJson(Map<String, dynamic> json){
    exercises = List.from(json['exercises']).map((e)=>Exercises.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['exercises'] = exercises.map((e)=>e.toJson()).toList();
    return data;
  }
}

//exercise from json
Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));
String exerciseToJson(Exercise data) => json.encode(data.toJson());

class Exercises {
  Exercises({
    required this.tagId,
    required this.userInput,
    required this.durationMin,
    required this.met,
    required this.nfCalories,
    required this.photo,
    required this.compendiumCode,
    required this.name,
  });
  late final int tagId;
  late final String userInput;
  late final double durationMin;
  late final int met;
  late final double nfCalories;
  late final Photo photo;
  late final int compendiumCode;
  late final String name;
  
  Exercises.fromJson(Map<String, dynamic> json){
    tagId = json['tag_id'];
    userInput = json['user_input'];
    durationMin = json['duration_min'];
    met = json['met'];
    nfCalories = json['nf_calories'];
    photo = Photo.fromJson(json['photo']);
    compendiumCode = json['compendium_code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tag_id'] = tagId;
    data['user_input'] = userInput;
    data['duration_min'] = durationMin;
    data['met'] = met;
    data['nf_calories'] = nfCalories;
    data['photo'] = photo.toJson();
    data['compendium_code'] = compendiumCode;
    data['name'] = name;
    return data;
  }
}

//exercises from json
Exercises exercisesFromJson(String str) => Exercises.fromJson(json.decode(str));
String exercisesToJson(Exercises data) => json.encode(data.toJson());