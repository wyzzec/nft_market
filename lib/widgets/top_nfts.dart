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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              StrokedTextWidget(
                  text: 'Top NFTs',
                  fontSize: titleText,
                  internColor: Colors.grey,
                  strokeColor: Colors.white30),
              const Spacer(),
              Container(
                height: 30,
                alignment: Alignment.bottomLeft,
                child: StrokedTextWidget(
                    text: 'View all',
                    fontSize: secondaryText,
                    internColor: Colors.grey,
                    strokeColor: Colors.white30),
              ),
            ],
          ),
        ),
        httpController.state == HttpState.loading
            ? const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              )
            : SizedBox(
              width: double.infinity,
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: httpController.apiNftInitialObject!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                            create: (_) => PaletteGeneratorController()),
                      ],
                      child: TopNftsItem(
                        nftModel: httpController.apiNftInitialObject![index],
                      ),
                    );
                  },
                ),
            ),
      ],
    );
  }
}
