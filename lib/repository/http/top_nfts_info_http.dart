import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nft_market/api_model/owned_nfts_model.dart';
import '../interface_top_nfts_info_repository.dart';

class TopNftsInfoHttp implements InterfaceTopNftsInfoRepository {
  Uri url = Uri.parse(
      'https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D');

  @override
  Future<List<OwnedNftsModel>> findAllNfts() async {
    final http.Response response = await http.get(Uri.parse('https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D'));
    if (response.statusCode == 200) {
      List<OwnedNftsModel> ownedNfts = List<OwnedNftsModel>.from(jsonDecode(response.body)['ownedNfts'].map((element) => OwnedNftsModel.fromMap(element)));
      return ownedNfts.where((element) => !element.metadata.image.contains('data:image/svg+xml;base64')).toList();

    }else{
      throw Exception ('Failed to load API');
    }
  }

}