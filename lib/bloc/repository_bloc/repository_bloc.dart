import 'dart:async';
import 'package:nft_market/api_model/owned_nfts_model.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_events/repository_bloc_event_interface.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_events/repository_bloc_event_load.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_error.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_interface.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_loaded.dart';
import 'package:nft_market/bloc/repository_bloc/repository_bloc_states/repository_bloc_state_loading.dart';
import 'package:nft_market/repository/interface_top_nfts_info_repository.dart';


class RepositoryBloc{
  RepositoryBloc(
      {required this.interfaceTopNftsInfoRepository}){
    _inputRepositoryController.stream.listen(_mapEventToState);
  }

  final StreamController<RepositoryBlocEventInterface> _inputRepositoryController = StreamController<RepositoryBlocEventInterface>();
  final StreamController<RepositoryBlocStateInterface> _outputRepositoryController = StreamController<RepositoryBlocStateInterface>();

  Sink<RepositoryBlocEventInterface> get inputRepository => _inputRepositoryController.sink;
  Stream<RepositoryBlocStateInterface> get outputRepository => _outputRepositoryController.stream;


  final InterfaceTopNftsInfoRepository interfaceTopNftsInfoRepository;

  _mapEventToState (RepositoryBlocEventInterface event) async {
    _outputRepositoryController.add(RepositoryBlocStateLoading());
    if (event is RepositoryBlocEventLoad){
      List<OwnedNftsModel> apiNftInitialObject;
      try {
        Map<String, dynamic> body;
        body = await interfaceTopNftsInfoRepository.findData();
        apiNftInitialObject = List<OwnedNftsModel>.from(
            body['ownedNfts'].map((element) => OwnedNftsModel.fromMap(element))).where((element) => (element.metadata.imageUrl != null &&
            (element.metadata.imageUrl!.contains('https://duskbreakers.gg') ||
                element.metadata.imageUrl!.contains('ipfs://'))))
            .toList();
        _outputRepositoryController.add(RepositoryBlocStateLoaded(apiInitialObject: apiNftInitialObject));
      }catch (e) {
        _outputRepositoryController.add(RepositoryBlocStateError(message: e.toString()));
      }
    }
  }
}