import 'dart:convert';

//Food Model Response
class FoodModel {
  List<Common>? common;
  List<Branded>? branded;

  FoodModel({this.common, this.branded});

  FoodModel.fromJson(Map<String, dynamic> json) {
    if (json['common'] != null) {
      common = <Common>[];
      json['common'].forEach((v) {
        common?.add(Common.fromJson(v));
      });
    }
    if (json['branded'] != null) {
      branded = <Branded>[];
      json['branded'].forEach((v) {
        branded?.add(Branded.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (common != null) {
      data['common'] = common?.map((v) => v.toJson()).toList();
    }
    if (branded != null) {
      data['branded'] = branded?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

FoodModel foodFromJson(String str) => FoodModel.fromJson(json.decode(str));
String foodToJson(FoodModel data) => json.encode(data.toJson());

//Common food model
List<Common> commonFoodFromjson(String str) => List<Common>.from(
    json.decode(str)['common'].map((x) => Common.fromJson(x)));
String commonToJson(List<Common> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Common {
  String? foodName;
  String? servingUnit;
  String? tagName;
  int? servingQty;
  dynamic commonType;
  String? tagId;
  Photo? photo;
  String? locale;

  Common(
      {this.foodName,
      this.servingUnit,
      this.tagName,
      this.servingQty,
      this.commonType,
      this.tagId,
      this.photo,
      this.locale});

  Common.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    servingUnit = json['serving_unit'];
    tagName = json['tag_name'];
    servingQty = json['serving_qty'];
    commonType = json['common_type'];
    tagId = json['tag_id'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_name'] = foodName;
    data['serving_unit'] = servingUnit;
    data['tag_name'] = tagName;
    data['serving_qty'] = servingQty;
    data['common_type'] = commonType;
    data['tag_id'] = tagId;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    data['locale'] = locale;
    return data;
  }
}

//Photo Model included in common  and branded food
class Photo {
  String? thumb;
  dynamic highres;
  bool? isUserUploaded;

  Photo({this.thumb, this.highres, this.isUserUploaded});

  Photo.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    highres = json['highres'];
    isUserUploaded = json['is_user_uploaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    data['highres'] = highres;
    data['is_user_uploaded'] = isUserUploaded;
    return data;
  }
}

//Branded food model
class Branded {
  String? foodName;
  String? servingUnit;
  String? nixBrandId;
  String? brandNameItemName;
  num? servingQty;
  num? nfCalories;
  Photo? photo;
  String? brandName;
  int? region;
  int? brandType;
  String? nixItemId;
  String? locale;

  Branded(
      {this.foodName,
      this.servingUnit,
      this.nixBrandId,
      this.brandNameItemName,
      this.servingQty,
      this.nfCalories,
      this.photo,
      this.brandName,
      this.region,
      this.brandType,
      this.nixItemId,
      this.locale});

  Branded.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    servingUnit = json['serving_unit'];
    nixBrandId = json['nix_brand_id'];
    brandNameItemName = json['brand_name_item_name'];
    servingQty = json['serving_qty'];
    nfCalories = json['nf_calories'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    brandName = json['brand_name'];
    region = json['region'];
    brandType = json['brand_type'];
    nixItemId = json['nix_item_id'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['food_name'] = foodName;
    data['serving_unit'] = servingUnit;
    data['nix_brand_id'] = nixBrandId;
    data['brand_name_item_name'] = brandNameItemName;
    data['serving_qty'] = servingQty;
    data['nf_calories'] = nfCalories;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    data['brand_name'] = brandName;
    data['region'] = region;
    data['brand_type'] = brandType;
    data['nix_item_id'] = nixItemId;
    data['locale'] = locale;
    return data;
  }
}

List<Branded> brandedFoodFromjson(String str) => List<Branded>.from(json
    .decode(str)['branded']
    .map((x) => Branded.fromJson(Map<String, dynamic>.from(x))));

String brandedToJson(List<Branded> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

