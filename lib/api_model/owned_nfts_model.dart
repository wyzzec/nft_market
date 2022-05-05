import 'package:nft_market/api_model/meta_data_model.dart';

import 'id_model.dart';

class OwnedNftsModel{
  String title;
  String description;
  IdModel id;
  MetaDataModel metadata;

  OwnedNftsModel({
    required this.title,
    required this.description,
    required this.id,
    required this.metadata,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'metadata': metadata,
    };
  }

  factory OwnedNftsModel.fromMap(Map<String, dynamic> map) {
    return OwnedNftsModel(
      title: map['title'] as String,
      description: map['description'] as String,
      id: IdModel.fromMap(map['id']),
      metadata: MetaDataModel.fromMap(map['metadata']),
    );
  }
}
