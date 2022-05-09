import 'package:flutter/cupertino.dart';
import 'package:nft_market/repository/interface_top_nfts_info_repository.dart';
import 'package:nft_market/repository/top_nfts_info_http.dart';

import '../api_model/owned_nfts_model.dart';

enum HttpState { loading, loaded }

class HttpOwnedNftController extends ChangeNotifier {
  HttpOwnedNftController({
    required InterfaceTopNftsInfoRepository? topNftsInfoHttp,
  }) : _topNftsInfoHttp = topNftsInfoHttp;

  List<OwnedNftsModel>? apiNftInitialObject;
  final InterfaceTopNftsInfoRepository? _topNftsInfoHttp;
  HttpState state = HttpState.loading;

  Future<void> waitHttpInfo() async {
    var body;
    body = await _topNftsInfoHttp!.findData();
    apiNftInitialObject = List<OwnedNftsModel>.from(
        body['ownedNfts'].map((element) => OwnedNftsModel.fromMap(element)));
    apiNftInitialObject = apiNftInitialObject!
        .where((element) =>
            !(element.metadata.image.contains('data:image/svg+xml;base64')))
        .toList();
    state = HttpState.loaded;
    notifyListeners();
  }


}
