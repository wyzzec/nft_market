import 'package:flutter/cupertino.dart';
import 'package:nft_market/repository/http/top_nfts_info_http.dart';

import '../api_model/owned_nfts_model.dart';


enum HttpState {loading, loaded}
class HttpController extends ChangeNotifier{

  List<OwnedNftsModel>? apiNftInitialObject;
  final TopNftsInfoHttp _topNftsInfoHttp = TopNftsInfoHttp();
  HttpState state = HttpState.loading;

  Future<void> waitHttpInfo() async {
    await _topNftsInfoHttp.findAllNfts().then((value) => apiNftInitialObject = value);
    state = HttpState.loaded;
    notifyListeners();
  }
}
