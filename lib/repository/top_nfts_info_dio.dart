import 'package:nft_market/api_model/owned_nfts_model.dart';
import 'package:nft_market/repository/interface_top_nfts_info_repository.dart';

class TopNftsInfoDio implements InterfaceTopNftsInfoRepository{
  @override
  Future<List<OwnedNftsModel>> findData() {
    // TODO: implement findAllNfts
    throw UnimplementedError();
  }

}