class MetaDataModel {
  final String? name;
  final String? imageUrl;

  MetaDataModel({
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': imageUrl,
    };
  }

  factory MetaDataModel.fromMap(Map<String, dynamic> map) {
    return MetaDataModel(
      name: map['name'],
      imageUrl: map['image'],
    );
  }

  String? get imageUrlFormatted{
    String? imageUrlFormatted = imageUrl;
    if (imageUrl!.contains('ipfs://')) {
      imageUrlFormatted = imageUrl!.replaceRange(0, 7, 'https://ipfs.io/ipfs/');
    }
    return imageUrlFormatted;
  }
}
