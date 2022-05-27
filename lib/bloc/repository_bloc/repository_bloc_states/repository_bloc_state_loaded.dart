import 'package:nft_market/api_model/owned_nfts_model.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_interface.dart';

class RepositoryBlocStateLoaded extends RepositoryBlocStateInterface{
  RepositoryBlocStateLoaded({required List<OwnedNftsModel> apiInitialObject}) : super(apiInitialObject: apiInitialObject);

}