import 'package:nft_market/api_model/owned_nfts_model.dart';

abstract class RepositoryBlocStateInterface {
  List<OwnedNftsModel> apiInitialObject;

  RepositoryBlocStateInterface({
    required this.apiInitialObject,
  });
}