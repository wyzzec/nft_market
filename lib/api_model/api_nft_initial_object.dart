import 'package:nft_market/api_model/owned_nfts_model.dart';

class ApiNftInitialObject{
List<OwnedNftsModel> ownedNfts;

ApiNftInitialObject({
    required this.ownedNfts,
  });

Map<String, dynamic> toMap() {
    return {
      'ownedNfts': ownedNfts,
    };
  }

  factory ApiNftInitialObject.fromMap(Map<String, dynamic> map) {
    return ApiNftInitialObject(
      ownedNfts: List<OwnedNftsModel>.from(map['ownedNfts'].map((element) => OwnedNftsModel.fromMap(element))),
    );
  }
}