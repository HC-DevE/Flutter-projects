class Photo {
  String? thumb;
  String? highres;
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