import 'package:nft_market/api_model/token_meta_data_model.dart';

class IdModel{
  String tokenId;
  TokenMetaDataModel tokenMetadata;

  IdModel({
    required this.tokenId,
    required this.tokenMetadata,
  });

  Map<String, dynamic> toMap() {
    return {
      'tokenId': tokenId,
      'tokenType': tokenMetadata,
    };
  }

  factory IdModel.fromMap(Map<String, dynamic> map) {
    return IdModel(
      tokenId: map['tokenId'] as String,
      tokenMetadata: TokenMetaDataModel.fromMap(map['tokenMetadata']),
    );
  }
}