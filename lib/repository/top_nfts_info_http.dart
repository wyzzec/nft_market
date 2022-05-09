

import 'dart:convert';

import 'package:http/http.dart' as http;


import 'interface_top_nfts_info_repository.dart';

class TopNftsInfoHttp implements InterfaceTopNftsInfoRepository {
  String url = 'https://eth-mainnet.alchemyapi.io/v2/demo/getNFTs/?owner=0xfAE46f94Ee7B2Acb497CEcAFf6Cff17F621c693D';

  @override
  Future<dynamic> findData() async {
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load API');
    }
  }
}
