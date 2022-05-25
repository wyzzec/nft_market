import 'package:flutter/cupertino.dart';
import 'package:nft_market/repository/interface_top_nfts_info_repository.dart';


import '../api_model/owned_nfts_model.dart';

enum HttpState { loading, loaded }

class HttpOwnedNftController extends ChangeNotifier {
  HttpOwnedNftController({
    required InterfaceTopNftsInfoRepository? interfaceTopNftsInfoHttp,
  }) : _interfaceTopNftsInfoRepository = interfaceTopNftsInfoHttp;

  List<OwnedNftsModel>? apiNftInitialObject;
  final InterfaceTopNftsInfoRepository? _interfaceTopNftsInfoRepository;
  HttpState state = HttpState.loading;

  Future<void> waitHttpInfo() async {
    Map<String, dynamic> body;
    body = await _interfaceTopNftsInfoRepository!.findData();
    apiNftInitialObject = List<OwnedNftsModel>.from(
        body['ownedNfts'].map((element) => OwnedNftsModel.fromMap(element)));
    apiNftInitialObject = apiNftInitialObject!.where((element) => (element.metadata.imageUrl != null && (element.metadata.imageUrl!.contains('https://duskbreakers.gg') || element.metadata.imageUrl!.contains('ipfs://'))))
        .toList();
    state = HttpState.loaded;
    notifyListeners();
  }
}
