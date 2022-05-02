import 'package:nft_market/api_model/owned_nfts_model.dart';


abstract class InterfaceTopNftsInfoRepository{
  Future<List<OwnedNftsModel>> findAllNfts();
}