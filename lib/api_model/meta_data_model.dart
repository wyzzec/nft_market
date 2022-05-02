class MetaDataModel {
  String name;
  String image;

  MetaDataModel({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory MetaDataModel.fromMap(Map<String, dynamic> map) {
    return MetaDataModel(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}
