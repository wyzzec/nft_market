import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nft_market/controllers/http_owned_nft_controller.dart';
import 'package:nft_market/controllers/palette_generator_controller.dart';
import 'package:nft_market/widgets/stroked_text_widget.dart';
import 'package:provider/provider.dart';

import 'top_nfts_item.dart';

class TopNfts extends StatefulWidget {
  const TopNfts({Key? key}) : super(key: key);

  @override
  State<TopNfts> createState() => _TopNftsState();
}

class _TopNftsState extends State<TopNfts> {
  final double? titleText = 25;
  final double? secondaryText = 12;

  @override
  void initState() {
    context.read<HttpOwnedNftController>().waitHttpInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final httpController = context.watch<HttpOwnedNftController>();
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       StrokedTextWidget(
          //           text: 'Top NFTs',
          //           fontSize: titleText,
          //           internColor: Colors.grey,
          //           strokeColor: Colors.white30),
          //       const Spacer(),
          //     ],
          //   ),
          // ),
          httpController.state == HttpState.loading
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                )
              : Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount: httpController.apiNftInitialObject!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                                create: (_) => PaletteGeneratorController()),
                          ],
                          child: TopNftsItem(
                            nftModel:
                                httpController.apiNftInitialObject![index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
