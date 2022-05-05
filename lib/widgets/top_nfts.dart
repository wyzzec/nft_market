import 'package:flutter/material.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:nft_market/repository/http/top_nfts_info_http.dart';
import 'package:provider/provider.dart';
import '../api_model/owned_nfts_model.dart';
import 'top_nfts_item.dart';

class TopNfts extends StatefulWidget {
  const TopNfts({Key? key}) : super(key: key);

  @override
  State<TopNfts> createState() => _TopNftsState();
}

class _TopNftsState extends State<TopNfts> {
  final double? titleText = 25;
  final double? secondaryText = 12;
  List<OwnedNftsModel>? apiNftInitialObject;
  final TopNftsInfoHttp topNftsInfoHttp = TopNftsInfoHttp();
  bool loading = true;

  @override
  void initState() {
    waitRepositoryInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Top NFTs',
                style: TextStyle(
                  fontSize: titleText,
                ),
              ),
              const Spacer(),
              const Spacer(),
              Container(
                height: 30,
                alignment: Alignment.bottomLeft,
                child: Text(
                  'View all',
                  style: TextStyle(
                    fontSize: secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
        loading
            ? const SizedBox(
                width: 100, height: 100, child: CircularProgressIndicator())
            : Flexible(
                child: SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (OwnedNftsModel item in apiNftInitialObject!)
                          MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                  create: (_) => PaletteGeneratorController()),
                            ],
                            child: TopNftsItem(
                              nftModel: item,
                            ),
                          )
                      ],
                    )),
              ),
      ],
    );
  }

  Future<void> waitRepositoryInfo() async {
    await topNftsInfoHttp.findAllNfts().then((value) {
      apiNftInitialObject = value;
    });
    setState(() {
      loading = false;
    });
  }
}
